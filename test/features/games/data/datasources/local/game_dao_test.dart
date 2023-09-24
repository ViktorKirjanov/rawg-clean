import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/local/dao/game_dao.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

void main() {
  late AppDatabase database;
  late GameeDao gameDao;

  const game = GameEntity(
    id: 3498,
    slug: 'grand-theft-auto-v',
    name: 'Grand Theft Auto V',
    released: '2013-09-17',
    tba: false,
    backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
    rating: 4.47,
    ratingTop: 5,
    platforms: [
      PlatformsModel(
        platform: PlatformModel(
          id: 187,
          name: 'PlayStation 5',
          slug: Platform.playstation5,
        ),
      ),
    ],
  );

  setUp(() async {
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    gameDao = database.gameDao;
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets('Save game into database', (tester) async {
    await tester.runAsync(() async {
      // arrange

      // act
      await gameDao.insertGame(game);
      final games = await gameDao.findAll();

      // assert
      expect(games, isNotEmpty);
    });
  });

  testWidgets('Save game into database', (tester) async {
    await tester.runAsync(() async {
      // arrange

      // act
      await gameDao.deleteGame(game);
      final games = await gameDao.findAll();

      // assert
      expect(games, isEmpty);
    });
  });
}
