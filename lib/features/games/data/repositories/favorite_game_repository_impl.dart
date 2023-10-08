import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/favorite_game_repository.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteGameRepositoryImpl extends FavoriteGameRepository {
  FavoriteGameRepositoryImpl(
    this._appDatabase,
  );

  final AppDatabase _appDatabase;

  @override
  Future<Either<Failure, List<GameEntity>>> getSavedGames() async {
    try {
      final favoritesGames = await _appDatabase.gameDao.findAll();
      return Right(favoritesGames);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return const Left(DatabaseFailure('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeGame(GameEntity game) async {
    try {
      await _appDatabase.gameDao.deleteGame(game);
      return const Right(true);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return const Left(DatabaseFailure('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<Failure, bool>> saveGame(GameEntity game) async {
    try {
      await _appDatabase.gameDao.insertGame(game);
      return const Right(true);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return const Left(DatabaseFailure('Oops, something went wrong'));
    }
  }
}
