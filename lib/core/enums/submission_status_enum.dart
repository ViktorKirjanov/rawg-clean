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
