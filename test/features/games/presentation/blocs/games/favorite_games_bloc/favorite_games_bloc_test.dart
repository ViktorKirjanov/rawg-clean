import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/favorite_games_bloc/favorite_games_bloc.dart';

import '../../../../../../helpers/constants/entities.dart';

class MockGetFavoriteGamesUseCase extends Mock implements GetFavoriteGamesUseCase {}

class MockRemoveFavoriteGamesUseCase extends Mock implements RemoveFavoriteGamesUseCase {}

class MockSaveFavoriteGamesUseCase extends Mock implements SaveFavoriteGamesUseCase {}

void main() {
  late MockGetFavoriteGamesUseCase mockGetFavoriteGamesUseCase;
  late MockRemoveFavoriteGamesUseCase mockRemoveFavoriteGamesUseCase;
  late MockSaveFavoriteGamesUseCase mockSaveFavoriteGamesUseCase;

  setUp(() {
    mockGetFavoriteGamesUseCase = MockGetFavoriteGamesUseCase();
    mockRemoveFavoriteGamesUseCase = MockRemoveFavoriteGamesUseCase();
    mockSaveFavoriteGamesUseCase = MockSaveFavoriteGamesUseCase();
  });

  FavoriteGamesBloc buildBloc() => FavoriteGamesBloc(
        mockGetFavoriteGamesUseCase,
        mockRemoveFavoriteGamesUseCase,
        mockSaveFavoriteGamesUseCase,
      );

  test('works properly', () {
    expect(buildBloc, returnsNormally);
  });

  test('initialState should be Empty', () {
    // assert
    expect(buildBloc().state, equals(const FavoriteGamesState()));
  });

  void setUpMockGetFavoriteGamesUseCaseSuccess() => when(() => mockGetFavoriteGamesUseCase()).thenAnswer(
        (_) async => const Right([
          gameEntity,
          gameEntity,
          gameEntity,
        ]),
      );

  group('GetSavedGames', () {
    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: setUpMockGetFavoriteGamesUseCaseSuccess,
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetSavedGames()),
      verify: (_) => verify(
        () => mockGetFavoriteGamesUseCase(),
      ).called(1),
    );
    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: setUpMockGetFavoriteGamesUseCaseSuccess,
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetSavedGames()),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockGetFavoriteGamesUseCase(),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on GetSavedGames',
      setUp: () {
        when(() => mockGetFavoriteGamesUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetSavedGames()),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockGetFavoriteGamesUseCase(),
      ).called(1),
    );
  });

  group('RemoveGame', () {
    void setUpMockRemoveFavoriteGamesUseCaseSuccess() =>
        when(() => mockRemoveFavoriteGamesUseCase(game: gameEntity)).thenAnswer(
          (_) async => const Right(true),
        );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: () {
        setUpMockRemoveFavoriteGamesUseCaseSuccess();
        setUpMockGetFavoriteGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const RemoveGame(gameEntity)),
      verify: (_) => verify(
        () => mockRemoveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: () {
        setUpMockRemoveFavoriteGamesUseCaseSuccess();
        setUpMockGetFavoriteGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const RemoveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockRemoveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on RemoveGame, RemoveFavoriteGamesUseCase',
      setUp: () {
        when(() => mockRemoveFavoriteGamesUseCase(game: gameEntity))
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const RemoveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockRemoveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on RemoveGame, GetFavoriteGamesUseCase',
      setUp: () {
        setUpMockRemoveFavoriteGamesUseCaseSuccess();
        when(() => mockGetFavoriteGamesUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const RemoveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockRemoveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );
  });

  group('SaveGame', () {
    void setUpMockSaveFavoriteGamesUseCaseSuccess() =>
        when(() => mockSaveFavoriteGamesUseCase(game: gameEntity)).thenAnswer(
          (_) async => const Right(true),
        );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: () {
        setUpMockSaveFavoriteGamesUseCaseSuccess();
        setUpMockGetFavoriteGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const SaveGame(gameEntity)),
      verify: (_) => verify(
        () => mockSaveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: () {
        setUpMockSaveFavoriteGamesUseCaseSuccess();
        setUpMockGetFavoriteGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const SaveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockSaveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on SaveGame, SaveFavoriteGamesUseCase',
      setUp: () {
        when(() => mockSaveFavoriteGamesUseCase(game: gameEntity))
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const SaveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockSaveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on SaveGame, GetFavoriteGamesUseCase',
      setUp: () {
        setUpMockSaveFavoriteGamesUseCaseSuccess();
        when(() => mockGetFavoriteGamesUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const SaveGame(gameEntity)),
      expect: () => [
        const FavoriteGamesState(status: SubmissionStatus.inProgress),
        const FavoriteGamesState(
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockSaveFavoriteGamesUseCase(game: gameEntity),
      ).called(1),
    );
  });
}
