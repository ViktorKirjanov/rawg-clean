part of 'remote_games_bloc.dart';

class RemoteGamesState extends Equatable {
  const RemoteGamesState({
    this.games = const [],
    this.page = 1,
    this.search,
    this.hasMorePages = true,
    this.status = SubmissionStatus.inProgress,
    this.errorMessage,
  });

  final List<GameEntity> games;
  final int page;
  final String? search;
  final bool hasMorePages;
  final SubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        games,
        page,
        search,
        hasMorePages,
        status,
        errorMessage,
      ];

  RemoteGamesState copyWith({
    List<GameEntity>? games,
    int? page,
    ValueGetter<String?>? search,
    bool? hasMorePages,
    SubmissionStatus? status,
    String? errorMessage,
  }) =>
      RemoteGamesState(
        games: games ?? this.games,
        page: page ?? this.page,
        search: search != null ? search() : this.search,
        hasMorePages: hasMorePages ?? this.hasMorePages,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  String toString() =>
      'RemoteGamesState(games: ${games.length}, page: $page, search: $search, hasMorePages: $hasMorePages, status: $status, errorMessage: $errorMessage)';
}
