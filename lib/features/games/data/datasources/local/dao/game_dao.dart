import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

@dao
abstract class GameDao {
  @Insert()
  Future<void> insertGame(GameEntity game);

  @delete
  Future<void> deleteGame(GameEntity game);

  @Query('SELECT * FROM game')
  Future<List<GameEntity>> findAll();
}
