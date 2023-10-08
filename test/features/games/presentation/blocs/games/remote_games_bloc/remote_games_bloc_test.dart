import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

import '../../../../../../helpers/constants/entities.dart';

class MockGetRemoteGamesUseCase extends Mock implements GetRemoteGamesUseCase {}

class MockGetFavoriteGamesUseCase extends Mock implements GetFavoriteGamesUseCase {}

void main() {
  late MockGetRemoteGamesUseCase mockGetRemoteGamesUseCase;

  setUp(() {
    mockGetRemoteGamesUseCase = MockGetRemoteGamesUseCase();
  });

  RemoteGamesBloc buildBloc() => RemoteGamesBloc(
        mockGetRemoteGamesUseCase,
      );

  test('works properly', () {
    expect(buildBloc, returnsNormally);
  });

  test('initialState should be Empty', () {
    // assert
    expect(buildBloc().state, equals(const RemoteGamesState()));
  });

  const String searchText = 'Gears of war';

  void setUpMockGetRemoteGamesUseCaseSuccess() => when(() => mockGetRemoteGamesUseCase(any(), any())).thenAnswer(
        (_) async => const Right(paginationEntityResult),
      );

  blocTest<RemoteGamesBloc, RemoteGamesState>(
    'should get data from the concrete use case',
    setUp: setUpMockGetRemoteGamesUseCaseSuccess,
    build: buildBloc,
    act: (bloc) async => bloc.add(const GetFirstPage()),
    verify: (_) => verify(
      () => mockGetRemoteGamesUseCase(1, null),
    ).called(1),
  );

  group('AddSearch', () {
    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should set a search value',
      build: buildBloc,
      act: (bloc) async => bloc.add(const AddSearch(search: searchText)),
      expect: () => [
        const RemoteGamesState(search: searchText),
      ],
    );

    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should reset a search value',
      build: buildBloc,
      seed: () => const RemoteGamesState(search: searchText),
      act: (bloc) async => bloc.add(const AddSearch()),
      expect: () => [
        const RemoteGamesState(),
      ],
    );
  });

  group('GetFirstPage', () {
    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully',
      setUp: setUpMockGetRemoteGamesUseCaseSuccess,
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetFirstPage()),
      expect: () => [
        const RemoteGamesState(status: SubmissionStatus.inProgress),
        const RemoteGamesState(
          status: SubmissionStatus.inProgress,
          hasMorePages: false,
        ),
        const RemoteGamesState(
          page: 1,
          games: [gameEntity],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockGetRemoteGamesUseCase(1, null),
      ).called(1),
    );

    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully on refresh',
      setUp: setUpMockGetRemoteGamesUseCaseSuccess,
      build: buildBloc,
      seed: () => const RemoteGamesState(
        page: 2,
        games: [
          gameEntity,
          gameEntity,
          gameEntity,
          gameEntity,
        ],
        status: SubmissionStatus.success,
      ),
      act: (bloc) async => bloc.add(const GetFirstPage(reset: true)),
      expect: () => [
        const RemoteGamesState(
          status: SubmissionStatus.inProgress,
          page: 1,
          search: null,
        ),
        const RemoteGamesState(
          status: SubmissionStatus.inProgress,
          hasMorePages: false,
        ),
        const RemoteGamesState(
          page: 1,
          games: [gameEntity],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockGetRemoteGamesUseCase(1, null),
      ).called(1),
    );

    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should emit [inProgress, failure] when getting data fails on GetFirstPage',
      setUp: () {
        when(() => mockGetRemoteGamesUseCase(any(), any()))
            .thenAnswer((_) async => const Left(ServerFailure('Oops, something went wrong')));
      },
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetFirstPage()),
      expect: () => [
        const RemoteGamesState(status: SubmissionStatus.inProgress),
        const RemoteGamesState(
          status: SubmissionStatus.inProgress,
          hasMorePages: false,
        ),
        const RemoteGamesState(
          page: 1,
          hasMorePages: false,
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockGetRemoteGamesUseCase(1, null),
      ).called(1),
    );
  });

  group('GetFirstPage', () {
    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should emit [inProgress, success] when data is gotten successfully on GetNextPage',
      setUp: setUpMockGetRemoteGamesUseCaseSuccess,
      build: buildBloc,
      seed: () => const RemoteGamesState(
        page: 2,
        games: [
          gameEntity,
          gameEntity,
          gameEntity,
          gameEntity,
        ],
        status: SubmissionStatus.success,
      ),
      act: (bloc) async => bloc.add(GetNextPage()),
      expect: () => [
        const RemoteGamesState(
          page: 2,
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          status: SubmissionStatus.inProgress,
          hasMorePages: false,
        ),
        const RemoteGamesState(
          page: 3,
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          status: SubmissionStatus.success,
        ),
      ],
      verify: (_) => verify(
        () => mockGetRemoteGamesUseCase(3, null),
      ).called(1),
    );

    blocTest<RemoteGamesBloc, RemoteGamesState>(
      'should emit [inProgress, failure] when getting data fails on GetNextPage',
      setUp: () {
        when(() => mockGetRemoteGamesUseCase(any(), any())).thenAnswer(
          (_) async => const Left(
            ServerFailure('Oops, something went wrong'),
          ),
        );
      },
      build: buildBloc,
      seed: () => const RemoteGamesState(
        page: 2,
        games: [
          gameEntity,
          gameEntity,
          gameEntity,
          gameEntity,
        ],
        status: SubmissionStatus.success,
      ),
      act: (bloc) async => bloc.add(GetNextPage()),
      expect: () => [
        const RemoteGamesState(
          page: 2,
          status: SubmissionStatus.inProgress,
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          hasMorePages: false,
        ),
        const RemoteGamesState(
          page: 2,
          games: [
            gameEntity,
            gameEntity,
            gameEntity,
            gameEntity,
          ],
          hasMorePages: false,
          status: SubmissionStatus.failure,
          errorMessage: 'Oops, something went wrong',
        ),
      ],
      verify: (_) => verify(
        () => mockGetRemoteGamesUseCase(3, null),
      ).called(1),
    );
  });
}
