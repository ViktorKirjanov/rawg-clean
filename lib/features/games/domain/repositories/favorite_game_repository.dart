import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

abstract class FavoriteGameRepository {
  Future<Either<Failure, bool>> saveGame(GameEntity game);

  Future<Either<Failure, bool>> removeGame(GameEntity game);

  Future<Either<Failure, List<GameEntity>>> getSavedGames();
}
