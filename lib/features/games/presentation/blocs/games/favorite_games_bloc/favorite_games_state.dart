part of 'favorite_games_bloc.dart';

class FavoriteGamesState extends Equatable {
  const FavoriteGamesState({
    this.games = const [],
    this.status = SubmissionStatus.inProgress,
    this.errorMessage,
  });

  final List<GameEntity> games;
  final SubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        games,
        status,
        errorMessage,
      ];

  FavoriteGamesState copyWith({
    List<GameEntity>? games,
    SubmissionStatus? status,
    String? errorMessage,
  }) =>
      FavoriteGamesState(
        games: games ?? this.games,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  String toString() => 'FavoriteGamesState(games: ${games.length}, status: $status, errorMessage: $errorMessage)';
}
