import 'package:rawg_clean/core/usecases/usecase.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class SaveLocalGamesUseCase implements UseCase<void, GameEntity> {
  SaveLocalGamesUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  @override
  Future<void> call({GameEntity? params}) => _gameRepository.saveGame(params!);
}
