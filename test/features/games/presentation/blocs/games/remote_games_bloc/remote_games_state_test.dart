import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

void main() {
  group('RemoteGamesState', () {
    test('initial state supports value comparison', () {
      expect(
        const RemoteGamesState(),
        const RemoteGamesState(),
      );
    });

    test('initial state supports value comparison based on constructor data', () {
      expect(
        const RemoteGamesState(),
        const RemoteGamesState(
          games: [],
          page: 1,
          search: null,
          hasMorePages: true,
          status: SubmissionStatus.inProgress,
          errorMessage: null,
        ),
      );
    });
  });
}
