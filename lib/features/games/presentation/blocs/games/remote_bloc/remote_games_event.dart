part of 'remote_games_bloc.dart';

sealed class RemoteGamesEvent extends Equatable {
  const RemoteGamesEvent();

  @override
  List<Object> get props => [];
}

class GetGames extends RemoteGamesEvent {
  const GetGames();
}
