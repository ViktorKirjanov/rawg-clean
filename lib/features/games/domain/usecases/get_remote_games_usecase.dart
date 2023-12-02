import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/remote_game_repository.dart';

class GetRemoteGamesUseCase {
  GetRemoteGamesUseCase(this._repository);

  final RemoteGameRepository _repository;

  Future<Either<Failure, PaginationEntity<GameEntity>>> call(int page, String? search) =>
      _repository.getGames(page, search);
}
