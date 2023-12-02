import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/favorite_game_repository.dart';

class RemoveFavoriteGamesUseCase {
  RemoveFavoriteGamesUseCase(this._repository);

  final FavoriteGameRepository _repository;

  Future<Either<Failure, bool>> call({required GameEntity game}) => _repository.removeGame(game);
}
