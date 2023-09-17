import 'package:flutter/cupertino.dart';
import 'package:rawg_clean/core/widgets/loader.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/game_card.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    super.key,
    required this.games,
    required this.isInProgress,
    required this.hasMorePages,
    required this.onLoad,
  });

  final List<GameEntity> games;
  final bool isInProgress;
  final bool hasMorePages;
  final void Function() onLoad;

  @override
  Widget build(BuildContext context) => SliverSafeArea(
        top: false,
        sliver: SliverList.builder(
          itemCount: games.length + 1,
          itemBuilder: (context, index) {
            if (index == games.length - 1) {
              if (hasMorePages) {
                onLoad();
              }
            }
            if (index == games.length) {
              if (isInProgress) {
                return const SizedBox(
                  height: 100.0,
                  child: Loader(),
                );
              } else {
                return const SizedBox();
              }
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: GameCard(
                  game: games[index],
                ),
              );
            }
          },
        ),
      );
}
