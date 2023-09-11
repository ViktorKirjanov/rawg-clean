import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';

@GenerateMocks(
  [
    GameRepository,
  ],
  customMocks: [MockSpec<Dio>(as: #MockthhpClient)],
)
void main() {}
