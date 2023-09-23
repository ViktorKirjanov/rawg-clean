part of 'local_games_bloc.dart';

class LocalGamesState extends Equatable {
  const LocalGamesState({
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

  LocalGamesState copyWith({
    List<GameEntity>? games,
    SubmissionStatus? status,
    String? errorMessage,
  }) =>
      LocalGamesState(
        games: games ?? this.games,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  String toString() => 'LocalGamesState(games: ${games.length}, status: $status, errorMessage: $errorMessage)';
}
