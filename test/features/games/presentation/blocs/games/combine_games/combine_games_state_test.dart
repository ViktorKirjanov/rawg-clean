import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/presentation/blocs/combine_cubit/combine_games_cubit.dart';

void main() {
  group('CombineGamesState', () {
    test('initial state supports value comparison', () {
      expect(
        const CombineGamesState(),
        const CombineGamesState(),
      );
    });

    test('initial state supports value comparison based on constructor data', () {
      expect(
        const CombineGamesState(),
        const CombineGamesState(
          status: SubmissionStatus.initial,
          errorMessage: null,
        ),
      );
    });
  });
}
