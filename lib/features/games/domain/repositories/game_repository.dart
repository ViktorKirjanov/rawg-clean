import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

abstract class GameRepository {
  // API methods
  Future<Either<Failure, PaginationEntity<GameEntity>>> getGames(int page);

  //Local Database methods
  Future<Either<Failure, bool>> saveGame(GameEntity game);

  Future<Either<Failure, bool>> removeGame(GameEntity game);

  Future<Either<Failure, List<GameEntity>>> getSavedGames();
}
