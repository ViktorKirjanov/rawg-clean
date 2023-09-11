import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class GetGamesUseCase {
  GetGamesUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  Future<Either<Failure, PaginationEntity<GameEntity>>> call(int page) => _gameRepository.getGames(page);
}
