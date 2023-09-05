part of 'remote_games_bloc.dart';

sealed class RemoteGamesState extends Equatable {
  const RemoteGamesState();

  @override
  List<Object?> get props => [];
}

class LoadingRemoteGamesState extends RemoteGamesState {
  const LoadingRemoteGamesState();
}

class SuccessRemoteGamesState extends RemoteGamesState {
  const SuccessRemoteGamesState({required this.games});

  final PaginationEntity<GameEntity> games;
}

class FailedRemoteGamesState extends RemoteGamesState {
  const FailedRemoteGamesState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
