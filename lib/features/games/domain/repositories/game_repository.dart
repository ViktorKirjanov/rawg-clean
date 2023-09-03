import 'package:rawg_clean/core/resources/data_state.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

abstract class GameRepository {
  Future<DataState<PaginationEntity<GameEntity>>> getGames();
}
