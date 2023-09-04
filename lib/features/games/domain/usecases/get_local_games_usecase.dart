import 'package:rawg_clean/core/usecases/usecase.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class GetLocalGamesUseCase implements UseCase<List<GameEntity>, void> {
  GetLocalGamesUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  @override
  Future<List<GameEntity>> call({void params}) => _gameRepository.getSavedGames();
}
