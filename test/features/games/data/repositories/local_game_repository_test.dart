import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/data/repositories/local_game_repository_impl.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:sqflite/src/sqflite_import.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAppDatabase mockAppDatabase;
  late MockGameDao mockGameDao;
  late LocalGameRepositoryImpl localGameRepositoryImpl;

  const gameEntity = GameEntity(
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
    mockAppDatabase = MockAppDatabase();
    mockGameDao = MockGameDao();
    localGameRepositoryImpl = LocalGameRepositoryImpl(mockAppDatabase);
  });

  tearDown(() async {
    await mockAppDatabase.close();
  });

  group('LocalGameRepositoryImpl', () {
    test(
      'should return empty list of games when a call to data source is successful',
      () async {
        final List<GameEntity> localGames = [];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.findAll()).thenAnswer((_) async => localGames);

        // act
        final result = await localGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(localGames),
          ),
        );
      },
    );

    test(
      'should return list of games when a call to insert data is successful',
      () async {
        final List<GameEntity> localGames = [gameEntity];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.insertGame(gameEntity)).thenAnswer((_) async => localGames);
        when(mockGameDao.findAll()).thenAnswer((_) async => localGames);

        // act
        await localGameRepositoryImpl.saveGame(gameEntity);
        final result = await localGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(localGames),
          ),
        );
      },
    );

    test(
      'should return list of games when a call to delete data is successful',
      () async {
        final List<GameEntity> localGames = [];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.deleteGame(gameEntity)).thenAnswer((_) async => localGames);
        when(mockGameDao.findAll()).thenAnswer((_) async => localGames);

        // act
        await localGameRepositoryImpl.removeGame(gameEntity);
        final result = await localGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(localGames),
          ),
        );
      },
    );

    group('should return database failure', () {
      test(
        'on getSavedGames()',
        () async {
          // arrange
          when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
          when(mockGameDao.findAll()).thenThrow(SqfliteDatabaseException('Your error message', 123));

          // act
          final result = await localGameRepositoryImpl.getSavedGames();

          // assert
          expect(
            result,
            equals(
              const Left<Failure, List<GameEntity>>(DatabaseFailure('Oops, something went wrong')),
            ),
          );
        },
      );

      test(
        'on saveGame()',
        () async {
          // arrange
          when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
          when(mockGameDao.insertGame(gameEntity)).thenThrow(SqfliteDatabaseException('Your error message', 123));

          // act
          final result = await localGameRepositoryImpl.saveGame(gameEntity);

          // assert
          expect(
            result,
            equals(
              const Left<Failure, List<GameEntity>>(DatabaseFailure('Oops, something went wrong')),
            ),
          );
        },
      );

      test(
        'on removeGame()',
        () async {
          // arrange
          when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
          when(mockGameDao.deleteGame(gameEntity)).thenThrow(SqfliteDatabaseException('Your error message', 123));

          // act
          final result = await localGameRepositoryImpl.removeGame(gameEntity);

          // assert
          expect(
            result,
            equals(
              const Left<Failure, List<GameEntity>>(DatabaseFailure('Oops, something went wrong')),
            ),
          );
        },
      );
    });
  });
}
