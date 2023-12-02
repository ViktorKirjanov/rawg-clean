import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/local/dao/game_dao.dart';

import '../../../../../helpers/constants/entities.dart';

void main() {
  late AppDatabase database;
  late GameDao gameDao;

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
      await gameDao.insertGame(gameEntity);
      final games = await gameDao.findAll();

      // assert
      expect(games, isNotEmpty);
    });
  });

  testWidgets('Save game into database', (tester) async {
    await tester.runAsync(() async {
      // arrange

      // act
      await gameDao.deleteGame(gameEntity);
      final games = await gameDao.findAll();

      // assert
      expect(games, isEmpty);
    });
  });
}
