import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';

@dao
abstract class GameeDao {
  @Insert()
  Future<void> insertGame(GameModel game);

  @delete
  Future<void> deleteGame(GameModel game);

  @Query('SELECT * FROM game')
  Future<List<GameModel>> getGames();
}
