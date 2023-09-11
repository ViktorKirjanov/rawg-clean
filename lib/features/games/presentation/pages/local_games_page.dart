import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/core/widgets/background_image.dart';
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
        body: BackgroundImage(
          image: 'assets/backgrounds/witcher.jpg',
          child: BlocBuilder<LocalGamesBloc, LocalGamesState>(
            bloc: sl(),
            builder: (context, state) {
              if (state is SuccessLocalGamesState) {
                if (state.games.isNotEmpty) {
                  return GameList(
                    games: state.games,
                    isInProgress: false,
                    hasMorePages: false,
                    onLoad: () {},
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No saved games',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 20.0,
                      ),
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
}
