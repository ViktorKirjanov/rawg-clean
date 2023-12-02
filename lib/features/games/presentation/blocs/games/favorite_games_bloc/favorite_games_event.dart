part of 'favorite_games_bloc.dart';

sealed class FavoriteGamesEvent extends Equatable {
  const FavoriteGamesEvent();

  @override
  List<Object> get props => [];
}

class GetSavedGames extends FavoriteGamesEvent {
  const GetSavedGames();
}

class RemoveGame extends FavoriteGamesEvent {
  const RemoveGame(this.game);

  final GameEntity game;

  @override
  List<Object> get props => [game];
}

class SaveGame extends FavoriteGamesEvent {
  const SaveGame(this.game);

  final GameEntity game;

  @override
  List<Object> get props => [game];
}
