import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/local/dao/game_dao.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/domain/repositories/local_game_repository.dart';
import 'package:rawg_clean/features/games/domain/repositories/remote_game_repository.dart';

@GenerateMocks(
  [
    RemoteGameRepository,
    LocalGameRepository,
    GamesDataSource,
    AppDatabase,
    GameDao,
  ],
  customMocks: [MockSpec<Dio>(as: #MockDioClient)],
)
void main() {}
