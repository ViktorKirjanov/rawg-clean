import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';

import '../../../../helpers/constants/entities.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteGameRepository mockGameRepository;
  late GetRemoteGamesUseCase getRemoteGamesUseCase;

  setUp(() {
    mockGameRepository = MockRemoteGameRepository();
    getRemoteGamesUseCase = GetRemoteGamesUseCase(mockGameRepository);
  });

  test('should get 1 game', () async {
    const pagination = PaginationEntity(
      count: 1,
      next: null,
      previous: null,
      results: [gameEntity],
    );

    // arange
    when(mockGameRepository.getGames(1, null)).thenAnswer((_) async => const Right(pagination));

    // act
    final result = await getRemoteGamesUseCase(1, null);

    // assert
    expect(result, const Right<Failure, PaginationEntity<GameEntity>>(pagination));
  });

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockGameRepository.getGames(1, null))
          .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));

      // act
      final result = await getRemoteGamesUseCase(1, null);

      // assert
      expect(
        result,
        equals(
          const Left<ServerFailure, PaginationEntity<GameEntity>>(
            ServerFailure('Oops, something went wrong'),
          ),
        ),
      );
    },
  );
}
