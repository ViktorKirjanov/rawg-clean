import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rawg_clean/core/constants/constants.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';
import 'package:sqflite/sqflite.dart';

class GameRepositoryImpl extends GameRepository {
  GameRepositoryImpl(
    this._gamesDataSource,
    this._appDatabase,
  );

  final GamesDataSource _gamesDataSource;
  final AppDatabase _appDatabase;

  @override
  Future<Either<Failure, PaginationModel<GameEntity>>> getGames(int page, String? search) async {
    try {
      final httpResponse = await _gamesDataSource.getGames(
        apiKey: apiKey,
        pageSize: 1000,
        page: page,
        search: search,
      );
      return Right(httpResponse.data);
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (error) {
      log('🐞Error: $error', stackTrace: error.stackTrace);
      return Left(ServerFailure(error.message ?? 'Oops, something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<GameEntity>>> getSavedGames() async {
    try {
      final localGames = await _appDatabase.gameeDao.getGames();
      return Right(localGames);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return Left(DatabaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeGame(GameEntity game) async {
    try {
      await _appDatabase.gameeDao.deleteGame(game);
      return const Right(true);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return Left(DatabaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveGame(GameEntity game) async {
    try {
      await _appDatabase.gameeDao.insertGame(game);
      return const Right(true);
    } on DatabaseException catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      return Left(DatabaseFailure(error.toString()));
    }
  }
}
