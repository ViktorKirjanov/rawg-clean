import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/favorite_games_bloc/favorite_games_bloc.dart';

void main() {
  group('FavoriteGamesState', () {
    test('initial state supports value comparison', () {
      expect(
        const FavoriteGamesState(),
        const FavoriteGamesState(),
      );
    });

    test('initial state supports value comparison based on constructor data', () {
      expect(
        const FavoriteGamesState(),
        const FavoriteGamesState(
          games: [],
          status: SubmissionStatus.inProgress,
          errorMessage: null,
        ),
      );
    });
  });
}
