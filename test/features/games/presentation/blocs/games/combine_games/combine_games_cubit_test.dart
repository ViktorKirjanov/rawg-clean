import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_favorite_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/combine_cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/favorite_games_bloc/favorite_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

class MockGetRemoteGamesUseCase extends Mock implements GetRemoteGamesUseCase {}

class MockGetFavoriteGamesUseCase extends Mock implements GetFavoriteGamesUseCase {}

class MockSaveFavoriteGamesUseCase extends Mock implements SaveFavoriteGamesUseCase {}

class MockRemoveFavoriteGamesUseCase extends Mock implements RemoveFavoriteGamesUseCase {}

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
    late MockGetFavoriteGamesUseCase mockGetFavoriteGamesUseCase;
    late MockSaveFavoriteGamesUseCase mockSaveFavoriteGamesUseCase;
    late MockRemoveFavoriteGamesUseCase removeFavoriteGamesUseCase;

    setUp(() {
      mockGetRemoteGamesUseCase = MockGetRemoteGamesUseCase();
      mockGetFavoriteGamesUseCase = MockGetFavoriteGamesUseCase();

      mockSaveFavoriteGamesUseCase = MockSaveFavoriteGamesUseCase();
      removeFavoriteGamesUseCase = MockRemoveFavoriteGamesUseCase();

      remoteGamesBloc = RemoteGamesBloc(mockGetRemoteGamesUseCase);
      favoriteGamesBloc = FavoriteGamesBloc(
        mockGetFavoriteGamesUseCase,
        removeFavoriteGamesUseCase,
        mockSaveFavoriteGamesUseCase,
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
