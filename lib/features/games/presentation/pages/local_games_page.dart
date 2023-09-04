import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_list.dart';
import 'package:rawg_clean/injection_container.dart';

class LocalGamesPage extends StatelessWidget {
  const LocalGamesPage({super.key, required this.games});

  final List<GameEntity> games;

  static MaterialPageRoute<void> route({required List<GameEntity> games}) => MaterialPageRoute(
        builder: (_) => LocalGamesPage(games: games),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Saved Games'),
        ),
        body: BlocBuilder<LocalGamesBloc, LocalGamesState>(
          bloc: sl(),
          builder: (context, state) {
            if (state is SuccessLocalGamesState) {
              return GameList(
                games: state.games,
                isInProgress: false,
                hasMorePages: false,
                onLoad: () {},
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
