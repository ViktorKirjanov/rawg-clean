part of 'local_games_bloc.dart';

sealed class LocalGamesEvent extends Equatable {
  const LocalGamesEvent();

  @override
  List<Object> get props => [];
}

class GetSavedGames extends LocalGamesEvent {
  const GetSavedGames();
}

class RemoveGame extends LocalGamesEvent {
  const RemoveGame(this.game);

  final GameEntity game;

  @override
  List<Object> get props => [game];
}

class SaveGame extends LocalGamesEvent {
  const SaveGame(this.game);

  final GameEntity game;

  @override
  List<Object> get props => [game];
}
