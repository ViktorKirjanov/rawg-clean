part of 'remote_games_bloc.dart';

sealed class RemoteGamesState extends Equatable {
  const RemoteGamesState({
    this.games,
    this.error,
  });

  final PaginationEntity<GameEntity>? games;
  final DioException? error;

  @override
  List<Object?> get props => [games, error];
}

class LoadingRemoteGamesState extends RemoteGamesState {
  const LoadingRemoteGamesState();
}

class SuccessRemoteGamesState extends RemoteGamesState {
  const SuccessRemoteGamesState(PaginationEntity<GameEntity> games) : super(games: games);
}

class FailedRemoteGamesState extends RemoteGamesState {
  const FailedRemoteGamesState(DioException error) : super(error: error);
}
