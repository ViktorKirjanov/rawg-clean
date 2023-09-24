import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rawg_clean/core/constants/constants.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/remote_game_repository.dart';

class RemoteGameRepositoryImpl extends RemoteGameRepository {
  RemoteGameRepositoryImpl(
    this._gamesDataSource,
  );

  final GamesDataSource _gamesDataSource;

  @override
  Future<Either<Failure, PaginationEntity<GameEntity>>> getGames(int page, String? search) async {
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
}
