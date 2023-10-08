import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/favorite_game_repository.dart';

class GetFavoriteGamesUseCase {
  GetFavoriteGamesUseCase(this._repository);

  final FavoriteGameRepository _repository;

  Future<Either<Failure, List<GameEntity>>> call() => _repository.getSavedGames();
}
