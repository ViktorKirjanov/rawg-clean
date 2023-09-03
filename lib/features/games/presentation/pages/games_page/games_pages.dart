import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_list.dart';
import 'package:rawg_clean/injection_container.dart';

class GamesPages extends StatelessWidget {
  const GamesPages({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<RemoteGamesBloc>(
        create: (context) => sl()..add(const GetGames()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Games'),
          ),
          body: const _GamePageView(),
        ),
      );
}

class _GamePageView extends StatelessWidget {
  const _GamePageView();

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoteGamesBloc, RemoteGamesState>(
        builder: (_, state) {
          if (state is Loading) {
            return const Loader();
          } else if (state is Success) {
            return GameList(
              games: state.games!.results!,
              isInProgress: false,
              hasMorePages: false,
              onLoad: () {},
            );
          } else if (state is Failed) {
            return const Center(child: Icon(Icons.error));
          }
          return const SizedBox.shrink();
        },
      );
}
