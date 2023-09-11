import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class GetLocalGamesUseCase {
  GetLocalGamesUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  Future<Either<Failure, List<GameEntity>>> call() => _gameRepository.getSavedGames();
}
