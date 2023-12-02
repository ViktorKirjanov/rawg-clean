import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_favorite_games_usecase.dart';

import '../../../../helpers/constants/entities.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockFavoriteGameRepository mockFavoriteGameRepository;
  late GetFavoriteGamesUseCase getRemoteGamesUseCase;

  setUp(() {
    mockFavoriteGameRepository = MockFavoriteGameRepository();
    getRemoteGamesUseCase = GetFavoriteGamesUseCase(mockFavoriteGameRepository);
  });

  test('should get all games', () async {
    // arange
    when(mockFavoriteGameRepository.getSavedGames()).thenAnswer((_) async => const Right([gameEntity]));

    // act
    final result = await getRemoteGamesUseCase();

    // assert
    expect(result, const Right<Failure, List<GameEntity>>([gameEntity]));
  });

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockFavoriteGameRepository.getSavedGames())
          .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));

      // act
      final result = await getRemoteGamesUseCase();

      // assert
      expect(
        result,
        equals(
          const Left<ServerFailure, List<GameEntity>>(
            ServerFailure('Oops, something went wrong'),
          ),
        ),
      );
    },
  );
}
