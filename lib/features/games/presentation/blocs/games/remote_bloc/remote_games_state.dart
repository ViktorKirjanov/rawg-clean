part of 'remote_games_bloc.dart';

class RemoteGamesState extends Equatable {
  const RemoteGamesState({
    this.games = const [],
    this.page = 1,
    this.hasMorePages = true,
    this.status = SubmissionStatus.inProgress,
    this.errorMessage,
  });

  final List<GameEntity> games;
  final int page;
  final bool hasMorePages;
  final SubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        games,
        page,
        hasMorePages,
        status,
        errorMessage,
      ];

  RemoteGamesState copyWith({
    List<GameEntity>? games,
    int? page,
    bool? hasMorePages,
    SubmissionStatus? status,
    String? errorMessage,
  }) =>
      RemoteGamesState(
        games: games ?? this.games,
        page: page ?? this.page,
        hasMorePages: hasMorePages ?? this.hasMorePages,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
