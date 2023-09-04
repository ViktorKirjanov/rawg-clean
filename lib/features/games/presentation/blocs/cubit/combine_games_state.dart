part of 'combine_games_cubit.dart';

enum SubmissionStatus {
  initial,
  inProgress,
  success,
  failure,
  canceled;

  bool get isInitial => this == SubmissionStatus.initial;
  bool get isInProgress => this == SubmissionStatus.inProgress;
  bool get isSuccess => this == SubmissionStatus.success;
  bool get isFailure => this == SubmissionStatus.failure;
  bool get isCanceled => this == SubmissionStatus.canceled;
}

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
      CombineGamesState(status: status ?? this.status);
}
