part of 'combine_games_cubit.dart';

class CombineGamesState extends Equatable {
  const CombineGamesState({
    this.status = SubmissionStatus.initial,
    this.errorMessage,
  });

  final SubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, errorMessage];

  CombineGamesState copyWith({
    SubmissionStatus? status,
    String? errorMessage,
  }) =>
      CombineGamesState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
