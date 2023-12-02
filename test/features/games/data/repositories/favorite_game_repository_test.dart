import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/repositories/favorite_game_repository_impl.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:sqflite/src/sqflite_import.dart';

import '../../../../helpers/constants/entities.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAppDatabase mockAppDatabase;
  late MockGameDao mockGameDao;
  late FavoriteGameRepositoryImpl favoriteGameRepositoryImpl;

  setUp(() async {
    mockAppDatabase = MockAppDatabase();
    mockGameDao = MockGameDao();
    favoriteGameRepositoryImpl = FavoriteGameRepositoryImpl(mockAppDatabase);
  });

  tearDown(() async {
    await mockAppDatabase.close();
  });

  group('FavoriteGameRepositoryImpl', () {
    test(
      'should return empty list of games when a call to data source is successful',
      () async {
        final List<GameEntity> favoriteGames = [];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.findAll()).thenAnswer((_) async => favoriteGames);

        // act
        final result = await favoriteGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(favoriteGames),
          ),
        );
      },
    );

    test(
      'should return list of games when a call to insert data is successful',
      () async {
        final List<GameEntity> favoriteGames = [gameEntity];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.insertGame(gameEntity)).thenAnswer((_) async => favoriteGames);
        when(mockGameDao.findAll()).thenAnswer((_) async => favoriteGames);

        // act
        await favoriteGameRepositoryImpl.saveGame(gameEntity);
        final result = await favoriteGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(favoriteGames),
          ),
        );
      },
    );

    test(
      'should return list of games when a call to delete data is successful',
      () async {
        final List<GameEntity> favoriteGames = [];

        // arrange
        when(mockAppDatabase.gameDao).thenReturn(mockGameDao);
        when(mockGameDao.deleteGame(gameEntity)).thenAnswer((_) async => favoriteGames);
        when(mockGameDao.findAll()).thenAnswer((_) async => favoriteGames);

        // act
        await favoriteGameRepositoryImpl.removeGame(gameEntity);
        final result = await favoriteGameRepositoryImpl.getSavedGames();

        // assert
        expect(
          result,
          equals(
            Right<Failure, List<GameEntity>>(favoriteGames),
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
          final result = await favoriteGameRepositoryImpl.getSavedGames();

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
          final result = await favoriteGameRepositoryImpl.saveGame(gameEntity);

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
          final result = await favoriteGameRepositoryImpl.removeGame(gameEntity);

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
