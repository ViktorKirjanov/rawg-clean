import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/favorite_games_bloc.dart';

import '../../../../../../helpers/constants/entities.dart';

void main() {
  group('LocalGamesEvent', () {
    group('GetSavedGames', () {
      test('supports value equality', () {
        expect(
          const GetSavedGames(),
          equals(const GetSavedGames()),
        );
      });

      test('props are correct', () {
        expect(const GetSavedGames().props, equals(<Object?>[]));
      });
    });

    group('RemoveGame', () {
      test('supports value equality', () {
        expect(
          const RemoveGame(gameEntity),
          equals(const RemoveGame(gameEntity)),
        );
      });

      test('props are correct', () {
        expect(const RemoveGame(gameEntity).props, equals(<Object?>[gameEntity]));
      });
    });

    group('SaveGame', () {
      test('supports value equality', () {
        expect(
          const SaveGame(gameEntity),
          equals(const SaveGame(gameEntity)),
        );
      });

      test('props are correct', () {
        expect(const SaveGame(gameEntity).props, equals(<Object?>[gameEntity]));
      });
    });
  });
}
