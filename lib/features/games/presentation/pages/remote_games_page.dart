import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
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
          body: const _GamePageView(),
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
            return const Center(child: Icon(Icons.error));
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
          if (state is LoadingRemoteGamesState) {
            return const Loader();
          } else if (state is SuccessRemoteGamesState) {
            return GameList(
              games: state.games!.results!,
              isInProgress: false,
              hasMorePages: false,
              onLoad: () {},
            );
          } else if (state is FailedRemoteGamesState) {
            return const Center(child: Icon(Icons.error));
          }
          return const SizedBox.shrink();
        },
      );
}
