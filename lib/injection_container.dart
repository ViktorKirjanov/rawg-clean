import 'package:get_it/get_it.dart';
import 'package:rawg_clean/core/client/dio_client.dart';
import 'package:rawg_clean/features/games/data/datasources/local/app_database.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/data/repositories/local_game_repository_impl.dart';
import 'package:rawg_clean/features/games/data/repositories/remote_game_repository_impl.dart';
import 'package:rawg_clean/features/games/domain/repositories/local_game_repository.dart';
import 'package:rawg_clean/features/games/domain/repositories/remote_game_repository.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_local_games_usecase.dart';
import 'package:rawg_clean/features/games/presentation/blocs/combine_cubit/combine_games_cubit.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/favorite_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl
    // External
    ..registerLazySingleton(() => DioClient().getDioClient())
    ..registerSingleton<AppDatabase>(database)

    // Data source
    ..registerSingleton<GamesDataSource>(GamesDataSource(sl()))

    // Repository
    ..registerSingleton<RemoteGameRepository>(RemoteGameRepositoryImpl(sl()))
    ..registerSingleton<LocalGameRepository>(LocalGameRepositoryImpl(sl()))

    // UseCases
    ..registerSingleton<GetRemoteGamesUseCase>(GetRemoteGamesUseCase(sl()))
    ..registerSingleton<GetLocalGamesUseCase>(GetLocalGamesUseCase(sl()))
    ..registerSingleton<SaveLocalGamesUseCase>(SaveLocalGamesUseCase(sl()))
    ..registerSingleton<RemoveLocalGamesUseCase>(RemoveLocalGamesUseCase(sl()))

    // Blocs
    ..registerSingleton<RemoteGamesBloc>(RemoteGamesBloc(sl()))
    ..registerSingleton(FavoriteGamesBloc(sl(), sl(), sl()))
    ..registerSingleton<CombineGamesCubit>(CombineGamesCubit(sl(), sl()));
}
