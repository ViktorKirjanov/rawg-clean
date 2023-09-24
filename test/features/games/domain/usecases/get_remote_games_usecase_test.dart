import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteGameRepository mockGameRepository;
  late GetRemoteGamesUseCase getRemoteGamesUseCase;

  setUp(() {
    mockGameRepository = MockRemoteGameRepository();
    getRemoteGamesUseCase = GetRemoteGamesUseCase(mockGameRepository);
  });

  test('should get 1 game', () async {
    const game = GameEntity(
      id: 3498,
      slug: 'grand-theft-auto-v',
      name: 'Grand Theft Auto V',
      released: '2013-09-17',
      tba: false,
      backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
      rating: 4.47,
      ratingTop: 5,
      platforms: [
        PlatformsModel(
          platform: PlatformModel(
            id: 187,
            name: 'PlayStation 5',
            slug: Platform.playstation5,
          ),
        ),
      ],
    );

    const pagination = PaginationEntity(
      count: 1,
      next: null,
      previous: null,
      results: [game],
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