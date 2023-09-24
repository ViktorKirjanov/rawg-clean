import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/local_game_repository.dart';

class RemoveLocalGamesUseCase {
  RemoveLocalGamesUseCase(this._repository);

  final LocalGameRepository _repository;

  Future<Either<Failure, bool>> call({required GameEntity game}) => _repository.removeGame(game);
}
