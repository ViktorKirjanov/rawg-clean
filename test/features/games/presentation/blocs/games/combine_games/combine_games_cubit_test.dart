import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_local_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/combine_cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/favorite_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

class MockGetRemoteGamesUseCase extends Mock implements GetRemoteGamesUseCase {}

class MockGetLocalGamesUseCase extends Mock implements GetLocalGamesUseCase {}

class MockSaveLocalGamesUseCase extends Mock implements SaveLocalGamesUseCase {}

class MockRemoveLocalGamesUseCase extends Mock implements RemoveLocalGamesUseCase {}

class MockCombineGamesCubit extends MockCubit<CombineGamesState> implements CombineGamesCubit {}

void main() {
  mainCubit();
}

void mainCubit() {
  group('CounterCubit', () {
    late RemoteGamesBloc remoteGamesBloc;
    late FavoriteGamesBloc favoriteGamesBloc;
    late CombineGamesCubit combineGamesCubit;

    late MockGetRemoteGamesUseCase mockGetRemoteGamesUseCase;
    late MockGetLocalGamesUseCase mockGetLocalGamesUseCase;
    late MockSaveLocalGamesUseCase mockSaveLocalGamesUseCase;
    late MockRemoveLocalGamesUseCase removeLocalGamesUseCase;

    setUp(() {
      mockGetRemoteGamesUseCase = MockGetRemoteGamesUseCase();
      mockGetLocalGamesUseCase = MockGetLocalGamesUseCase();

      mockSaveLocalGamesUseCase = MockSaveLocalGamesUseCase();
      removeLocalGamesUseCase = MockRemoveLocalGamesUseCase();

      remoteGamesBloc = RemoteGamesBloc(mockGetRemoteGamesUseCase);
      favoriteGamesBloc = FavoriteGamesBloc(
        mockGetLocalGamesUseCase,
        removeLocalGamesUseCase,
        mockSaveLocalGamesUseCase,
      );
      combineGamesCubit = CombineGamesCubit(remoteGamesBloc, favoriteGamesBloc);
    });

    blocTest<CombineGamesCubit, CombineGamesState>(
      'emits [] when nothing is called',
      build: () => combineGamesCubit,
      expect: () => const <int>[],
    );
  });
}
