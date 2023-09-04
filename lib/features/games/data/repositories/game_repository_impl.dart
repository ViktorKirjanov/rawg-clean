import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rawg_clean/core/constants/constants.dart';
import 'package:rawg_clean/core/resources/data_state.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

class GameRepositoryImpl extends GameRepository {
  GameRepositoryImpl(
    this._gamesDataSource,
    this._appDatabase,
  );

  final GamesDataSource _gamesDataSource;
  final AppDatabase _appDatabase;

  @override
  Future<DataState<PaginationModel<GameModel>>> getGames() async {
    try {
      final httpResponse = await _gamesDataSource.getGames(
        apiKey: apiKey,
        pageSize: 10,
        page: 1,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      log('🐞Error: $error', stackTrace: error.stackTrace);
      return DataFailed(error);
    }
  }

  @override
  Future<List<GameModel>> getSavedGames() async => _appDatabase.gameeDao.getGames();

  @override
  Future<void> removeGame(GameEntity game) async => _appDatabase.gameeDao.deleteGame(GameModel.fromEntity(game));

  @override
  Future<void> saveGame(GameEntity game) async => _appDatabase.gameeDao.insertGame(GameModel.fromEntity(game));
}
