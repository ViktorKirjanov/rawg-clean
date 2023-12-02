import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_favorite_games_usecase.dart';

import '../../../../helpers/constants/entities.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockFavoriteGameRepository mockFavoriteGameRepository;
  late SaveFavoriteGamesUseCase removeFavoriteGamesUseCase;

  setUp(() {
    mockFavoriteGameRepository = MockFavoriteGameRepository();
    removeFavoriteGamesUseCase = SaveFavoriteGamesUseCase(mockFavoriteGameRepository);
  });

  test('should save a game', () async {
    // arange
    when(mockFavoriteGameRepository.saveGame(gameEntity)).thenAnswer((_) async => const Right(true));

    // act
    final result = await removeFavoriteGamesUseCase(game: gameEntity);

    // assert
    expect(result, const Right<Failure, bool>(true));
  });

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockFavoriteGameRepository.saveGame(gameEntity))
          .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));

      // act
      final result = await removeFavoriteGamesUseCase(game: gameEntity);

      // assert
      expect(
        result,
        equals(
          const Left<ServerFailure, bool>(
            ServerFailure('Oops, something went wrong'),
          ),
        ),
      );
    },
  );
}
