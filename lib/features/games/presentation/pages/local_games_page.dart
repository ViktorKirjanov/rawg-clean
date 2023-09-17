import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/widgets/background_image.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/widgets/custom_scroll_view_wrapper.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/game_card.dart';
import 'package:rawg_clean/features/games/presentation/widgets/text_sliver_fill_remaining.dart';
import 'package:rawg_clean/injection_container.dart';

class LocalGamesPage extends StatelessWidget {
  const LocalGamesPage({super.key, required this.games});

  final List<GameEntity> games;

  static MaterialPageRoute<void> route({required List<GameEntity> games}) => MaterialPageRoute(
        builder: (_) => LocalGamesPage(games: games),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BackgroundImage(
          image: 'assets/backgrounds/witcher.jpg',
          child: CustomScrollViewWrapper(
            appbar: const Text('Saved Games'),
            pinned: false,
            floating: true,
            slivers: [
              BlocBuilder<LocalGamesBloc, LocalGamesState>(
                bloc: sl(),
                builder: (context, state) {
                  if (state is SuccessLocalGamesState) {
                    return SliverSafeArea(
                      top: false,
                      sliver: SliverList.builder(
                        itemCount: games.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: GameCard(
                            game: games[index],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const TextSliverFillRemaining(
                      text: 'Your list is empty',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
}
