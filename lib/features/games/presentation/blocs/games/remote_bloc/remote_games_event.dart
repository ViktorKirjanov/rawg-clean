part of 'remote_games_bloc.dart';

sealed class RemoteGamesEvent extends Equatable {
  const RemoteGamesEvent();

  @override
  List<Object> get props => [];
}

class GetFirstPage extends RemoteGamesEvent {
  const GetFirstPage({this.reset = false});

  final bool reset;

  @override
  List<Object> get props => [reset];
}

class GetNextPage extends RemoteGamesEvent {}

class GetGames extends RemoteGamesEvent {
  const GetGames(this.page, this.reset);

  final int page;
  final bool reset;

  @override
  List<Object> get props => [page, reset];
}
