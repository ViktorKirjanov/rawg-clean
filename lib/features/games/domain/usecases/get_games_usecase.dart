import 'package:rawg_clean/core/resources/data_state.dart';
import 'package:rawg_clean/core/usecases/usecase.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class GetGamesUseCase implements UseCase<DataState<PaginationEntity<GameEntity>>, void> {
  GetGamesUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  @override
  Future<DataState<PaginationEntity<GameEntity>>> call({void params}) => _gameRepository.getGames();
}
