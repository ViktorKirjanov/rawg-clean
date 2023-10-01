import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';

import '../../../../helpers/constants/entities.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockLocalGameRepository mockLocalGameRepository;
  late RemoveLocalGamesUseCase removeLocalGamesUseCase;

  setUp(() {
    mockLocalGameRepository = MockLocalGameRepository();
    removeLocalGamesUseCase = RemoveLocalGamesUseCase(mockLocalGameRepository);
  });

  test('should remove a game', () async {
    // arange
    when(mockLocalGameRepository.removeGame(gameEntity)).thenAnswer((_) async => const Right(true));

    // act
    final result = await removeLocalGamesUseCase(game: gameEntity);

    // assert
    expect(result, const Right<Failure, bool>(true));
  });

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockLocalGameRepository.removeGame(gameEntity))
          .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));

      // act
      final result = await removeLocalGamesUseCase(game: gameEntity);

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
