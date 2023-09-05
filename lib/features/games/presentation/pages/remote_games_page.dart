import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/core/widgets/background_image.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
import 'package:rawg_clean/core/widgets/refresh.dart';
import 'package:rawg_clean/features/games/presentation/blocs/cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/pages/local_games_page.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_list.dart';
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Games'),
            actions: [
              BlocBuilder<LocalGamesBloc, LocalGamesState>(
                builder: (context, state) {
                  if (state is SuccessLocalGamesState) {
                    return CupertinoButton(
                      child: const Icon(
                        FontAwesomeIcons.bookmark,
                        color: AppTheme.white,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(LocalGamesPage.route(games: state.games));
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          body: const BackgroundImage(
            image: 'assets/backgrounds/bioshock-infinite.jpg',
            child: _GamePageView(),
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage!,
                      style: const TextStyle(
                        color: AppTheme.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: OutlinedButton(
                        onPressed: () => sl<CombineGamesCubit>().getData(true),
                        child: const Text('Refresh'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );
}

class _GamesState extends StatelessWidget {
  const _GamesState();

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoteGamesBloc, RemoteGamesState>(
        builder: (_, state) {
          if (state.status.isInProgress && state.games.isEmpty) {
            return const Loader();
          } else if (state.games.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async => context.read<RemoteGamesBloc>().add(const GetFirstPage()),
              child: GameList(
                games: state.games,
                isInProgress: state.status.isInProgress,
                hasMorePages: state.hasMorePages,
                onLoad: () => context.read<RemoteGamesBloc>().add(GetNextPage()),
              ),
            );
          } else if (state.status.isSuccess && state.games.isEmpty) {
            return const Center(
              child: Text(
                'No more games!',
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 20.0,
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
      );
}
