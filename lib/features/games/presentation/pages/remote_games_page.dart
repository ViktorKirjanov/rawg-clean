import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/widgets/background_image.dart';
import 'package:rawg_clean/core/widgets/keyboard_dismisser.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
import 'package:rawg_clean/core/widgets/refresh.dart';
import 'package:rawg_clean/features/games/presentation/blocs/cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/widgets/android_refresh_indicator.dart';
import 'package:rawg_clean/features/games/presentation/widgets/custom_scroll_view_wrapper.dart';
import 'package:rawg_clean/features/games/presentation/widgets/custom_sliver_app_bar/bookmarks_button.dart';
import 'package:rawg_clean/features/games/presentation/widgets/custom_sliver_app_bar/search_text_input.dart';
import 'package:rawg_clean/features/games/presentation/widgets/custom_sliver_list.dart';
import 'package:rawg_clean/features/games/presentation/widgets/text_sliver_fill_remaining.dart';
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

class _GamesState extends StatelessWidget {
  const _GamesState();

  @override
  Widget build(BuildContext context) => AndroidRefreshIndicator(
        onRefresh: () async => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
        child: CustomScrollViewWrapper(
          appbar: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SearchTextInput(),
              SizedBox(width: 8.0),
              BookmarkButton(),
            ],
          ),
          pinned: true,
          floating: false,
          slivers: [
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
                  return CustomSliverList(
                    games: state.games,
                    isInProgress: state.status.isInProgress,
                    hasMorePages: state.hasMorePages,
                    onLoad: () => context.read<RemoteGamesBloc>().add(GetNextPage()),
                  );
                } else if (state.status.isSuccess && state.games.isEmpty) {
                  return const TextSliverFillRemaining(
                    text: 'Unfortunately, nothing was found',
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
