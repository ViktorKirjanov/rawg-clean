import 'package:get_it/get_it.dart';
import 'package:rawg_clean/core/client/dio_client.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/data/repositories/game_repository_impl.dart';
import 'package:rawg_clean/features/games/domain/repositories/game_repository.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl

    // External
    ..registerLazySingleton(() => DioClient().getDioClient())

    // Data source
    ..registerSingleton<GamesDataSource>(GamesDataSource(sl()))

    // Repository
    ..registerSingleton<GameRepository>(GameRepositoryImpl(sl()))

    // UseCases
    ..registerSingleton<GetGamesUseCase>(GetGamesUseCase(sl()))

    // Blocs
    ..registerSingleton<RemoteGamesBloc>(RemoteGamesBloc(sl()));
}
