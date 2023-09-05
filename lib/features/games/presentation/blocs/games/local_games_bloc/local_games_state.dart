part of 'local_games_bloc.dart';

sealed class LocalGamesState extends Equatable {
  const LocalGamesState();

  @override
  List<Object> get props => [];
}

class LoadingLocalGamesState extends LocalGamesState {
  const LoadingLocalGamesState();
}

class SuccessLocalGamesState extends LocalGamesState {
  const SuccessLocalGamesState({required this.games});

  final List<GameEntity> games;

  @override
  List<Object> get props => [games];
}

class FailedLocalGamesState extends LocalGamesState {
  const FailedLocalGamesState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
