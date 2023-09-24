import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

abstract class RemoteGameRepository {
  Future<Either<Failure, PaginationEntity<GameEntity>>> getGames(int page, String? search);
}
