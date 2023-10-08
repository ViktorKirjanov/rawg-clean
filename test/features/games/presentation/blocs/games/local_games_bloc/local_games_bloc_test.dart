import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_local_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/favorite_games_bloc.dart';

import '../../../../../../helpers/constants/entities.dart';

class MockGetLocalGamesUseCase extends Mock implements GetLocalGamesUseCase {}

class MockRemoveLocalGamesUseCase extends Mock implements RemoveLocalGamesUseCase {}

class MockSaveLocalGamesUseCase extends Mock implements SaveLocalGamesUseCase {}

void main() {
  late MockGetLocalGamesUseCase mockGetLocalGamesUseCase;
  late MockRemoveLocalGamesUseCase mockRemoveLocalGamesUseCase;
  late MockSaveLocalGamesUseCase mockSaveLocalGamesUseCase;

  setUp(() {
    mockGetLocalGamesUseCase = MockGetLocalGamesUseCase();
    mockRemoveLocalGamesUseCase = MockRemoveLocalGamesUseCase();
    mockSaveLocalGamesUseCase = MockSaveLocalGamesUseCase();
  });

  FavoriteGamesBloc buildBloc() => FavoriteGamesBloc(
        mockGetLocalGamesUseCase,
        mockRemoveLocalGamesUseCase,
        mockSaveLocalGamesUseCase,
      );

  test('works properly', () {
    expect(buildBloc, returnsNormally);
  });

  test('initialState should be Empty', () {
    // assert
    expect(buildBloc().state, equals(const FavoriteGamesState()));
  });

  void setUpMockGetLocalGamesUseCaseSuccess() => when(() => mockGetLocalGamesUseCase()).thenAnswer(
        (_) async => const Right([
          gameEntity,
          gameEntity,
          gameEntity,
        ]),
      );

  group('GetSavedGames', () {
    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: setUpMockGetLocalGamesUseCaseSuccess,
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetSavedGames()),
      verify: (_) => verify(
        () => mockGetLocalGamesUseCase(),
      ).called(1),
    );
    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: setUpMockGetLocalGamesUseCaseSuccess,
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
        () => mockGetLocalGamesUseCase(),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on GetSavedGames',
      setUp: () {
        when(() => mockGetLocalGamesUseCase())
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
        () => mockGetLocalGamesUseCase(),
      ).called(1),
    );
  });

  group('RemoveGame', () {
    void setUpMockRemoveLocalGamesUseCaseSuccess() =>
        when(() => mockRemoveLocalGamesUseCase(game: gameEntity)).thenAnswer(
          (_) async => const Right(true),
        );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: () {
        setUpMockRemoveLocalGamesUseCaseSuccess();
        setUpMockGetLocalGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const RemoveGame(gameEntity)),
      verify: (_) => verify(
        () => mockRemoveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: () {
        setUpMockRemoveLocalGamesUseCaseSuccess();
        setUpMockGetLocalGamesUseCaseSuccess();
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
        () => mockRemoveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on RemoveGame, RemoveLocalGamesUseCase',
      setUp: () {
        when(() => mockRemoveLocalGamesUseCase(game: gameEntity))
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
        () => mockRemoveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on RemoveGame, GetLocalGamesUseCase',
      setUp: () {
        setUpMockRemoveLocalGamesUseCaseSuccess();
        when(() => mockGetLocalGamesUseCase())
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
        () => mockRemoveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );
  });

  group('SaveGame', () {
    void setUpMockSaveLocalGamesUseCaseSuccess() => when(() => mockSaveLocalGamesUseCase(game: gameEntity)).thenAnswer(
          (_) async => const Right(true),
        );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should get data from the concrete use case',
      setUp: () {
        setUpMockSaveLocalGamesUseCaseSuccess();
        setUpMockGetLocalGamesUseCaseSuccess();
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const SaveGame(gameEntity)),
      verify: (_) => verify(
        () => mockSaveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: () {
        setUpMockSaveLocalGamesUseCaseSuccess();
        setUpMockGetLocalGamesUseCaseSuccess();
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
        () => mockSaveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on SaveGame, SaveLocalGamesUseCase',
      setUp: () {
        when(() => mockSaveLocalGamesUseCase(game: gameEntity))
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
        () => mockSaveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesState>(
      'should emit [inProgress, failure] when getting data fails on SaveGame, GetLocalGamesUseCase',
      setUp: () {
        setUpMockSaveLocalGamesUseCaseSuccess();
        when(() => mockGetLocalGamesUseCase())
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
        () => mockSaveLocalGamesUseCase(game: gameEntity),
      ).called(1),
    );
  });
}
