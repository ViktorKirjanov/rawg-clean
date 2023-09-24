import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/domain/repositories/remote_game_repository.dart';

@GenerateMocks(
  [
    RemoteGameRepository,
    GamesDataSource,
  ],
  customMocks: [MockSpec<Dio>(as: #MockthhpClient)],
)
void main() {}
