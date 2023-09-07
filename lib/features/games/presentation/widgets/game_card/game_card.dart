import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/game_image.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/ink_effect.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/like_button.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/name.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/platform_logo.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
  });

  final GameEntity game;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 280.0,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    GameImage(backgroundImage: game.backgroundImage),
                    Container(
                      height: 80.0,
                      width: double.infinity,
                      color: AppTheme.darkGrey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PlatformLogos(platforms: game.platforms),
                            const SizedBox(height: 8.0),
                            GameName(name: game.name),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const InkEffect(),
                LikeButton(game: game),
              ],
            ),
          ),
        ),
      );
}
