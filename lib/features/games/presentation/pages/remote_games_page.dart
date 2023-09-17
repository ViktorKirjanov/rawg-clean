import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/core/widgets/background_image.dart';
import 'package:rawg_clean/core/widgets/keyboard_dismisser.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
import 'package:rawg_clean/core/widgets/refresh.dart';
import 'package:rawg_clean/features/games/presentation/blocs/cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/widgets/android_refresh_indicator.dart';
import 'package:rawg_clean/features/games/presentation/widgets/sliver_app_bar_custom/sliver_app_bar_custom.dart';
import 'package:rawg_clean/features/games/presentation/widgets/sliver_list_custom.dart';
import 'package:rawg_clean/injection_container.dart';

class RemoteGamesPage extends StatelessWidget {
  const RemoteGamesPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CombineGamesCubit>(create: (context) => sl()..getData()),
          BlocProvider<RemoteGamesBloc>(create: (context) => sl()),
          BlocProvider<LocalGamesBloc>(create: (context) => sl()),
        ],
        child: const KeyboardDismisser(
          child: Scaffold(
            body: BackgroundImage(
              image: 'assets/backgrounds/bioshock-infinite.jpg',
              child: _GamePageView(),
            ),
          ),
        ),
      );
}

class _GamePageView extends StatelessWidget {
  const _GamePageView();

  @override
  Widget build(BuildContext context) => BlocBuilder<CombineGamesCubit, CombineGamesState>(
        builder: (_, state) {
          if (state.status.isInProgress) {
            return const Loader();
          } else if (state.status.isSuccess) {
            return const _GamesState();
          } else if (state.status.isFailure) {
            return Refresh(
              message: state.errorMessage!,
              onPressed: () => sl<CombineGamesCubit>().getData(true),
            );
          }
          return const SizedBox.shrink();
        },
      );
}

class _GamesState extends StatefulWidget {
  const _GamesState();

  @override
  State<_GamesState> createState() => _GamesStateState();
}

class _GamesStateState extends State<_GamesState> {
  late ScrollController _scrollController;

  late Color _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.0);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && _scrollController.offset <= 75) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(_scrollController.offset / 90);
        });
      } else if (_scrollController.offset <= 0) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.0);
        });
      } else {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.9);
        });
      }

      if (_appBarBackgroundColor.opacity >= .9) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.9);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => AndroidRefreshIndicator(
        onRefresh: () async => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBarCustom(appBarBackgroundColor: _appBarBackgroundColor),
            if (Platform.isIOS)
              CupertinoSliverRefreshControl(
                onRefresh: () async => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
              ),
            BlocBuilder<RemoteGamesBloc, RemoteGamesState>(
              builder: (context, state) {
                if (state.status.isInProgress && state.games.isEmpty) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Loader(),
                  );
                } else if (state.games.isNotEmpty) {
                  return SliverListCustom(
                    games: state.games,
                    isInProgress: state.status.isInProgress,
                    hasMorePages: state.hasMorePages,
                    onLoad: () => context.read<RemoteGamesBloc>().add(GetNextPage()),
                  );
                } else if (state.status.isSuccess && state.games.isEmpty) {
                  return const SliverFillRemaining(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Unfortunately, nothing was found',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state.status.isFailure) {
                  return Refresh(
                    message: state.errorMessage!,
                    onPressed: () => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      );
}
