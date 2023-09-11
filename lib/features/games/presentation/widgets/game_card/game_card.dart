import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/game_image.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/ink_effect.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/like_button.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/name.dart';
import 'package:rawg_clean/features/games/presentation/widgets/game_card/parent_platform_logo.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
  });

  final GameEntity game;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: Container(
          height: 300.0,
          decoration: const BoxDecoration(
            gradient: AppTheme.linearGradient,
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  GameImage(backgroundImage: game.backgroundImage),
                  SizedBox(
                    height: 100.0,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParentPlatformLogos(platforms: game.parentPlatforms),
                          const SizedBox(height: 12.0),
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
      );
}
