import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/injection_container.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.game,
  });

  final GameEntity game;

  @override
  Widget build(BuildContext context) => Positioned(
        top: 8.0,
        right: 8.0,
        child: BlocConsumer<LocalGamesBloc, LocalGamesState>(
          bloc: sl(),
          listener: (context, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
            }
          },
          builder: (_, state) {
            final isSelected = state.games.firstWhereOrNull((element) => element.id == game.id) != null;
            return GestureDetector(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Icon(
                          isSelected ? FontAwesomeIcons.solidBookmark : FontAwesomeIcons.bookmark,
                          color: isSelected ? AppTheme.red : AppTheme.black,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                isSelected ? sl<LocalGamesBloc>().add(RemoveGame(game)) : sl<LocalGamesBloc>().add(SaveGame(game));
              },
            );
          },
        ),
      );
}
