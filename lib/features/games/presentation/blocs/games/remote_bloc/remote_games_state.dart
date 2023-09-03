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

class Loading extends RemoteGamesState {
  const Loading();
}

class Success extends RemoteGamesState {
  const Success(PaginationEntity<GameEntity> games) : super(games: games);
}

class Failed extends RemoteGamesState {
  const Failed(DioException error) : super(error: error);
}
