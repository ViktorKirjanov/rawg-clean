import 'package:rawg_clean/core/resources/data_state.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

abstract class GameRepository {
  // API methods
  Future<DataState<PaginationEntity<GameEntity>>> getGames();

  //Local Database methods
  Future<void> saveGame(GameEntity game);

  Future<void> removeGame(GameEntity game);

  Future<List<GameEntity>> getSavedGames();
}
