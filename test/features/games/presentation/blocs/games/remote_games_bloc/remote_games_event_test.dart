import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';

void main() {
  group('RemoteGamesEvent', () {
    group('AddSearch', () {
      test('supports value equality', () {
        expect(
          const AddSearch(search: 'Gears of war'),
          equals(const AddSearch(search: 'Gears of war')),
        );
      });

      test('props are correct', () {
        expect(const AddSearch(search: 'Gears of war').props, equals(<Object?>['Gears of war']));
      });
    });

    group('GetFirstPage', () {
      test('supports value equality', () {
        expect(
          const GetFirstPage(),
          equals(const GetFirstPage()),
        );
      });

      test('props are correct', () {
        expect(const GetFirstPage().props, equals(<Object?>[false]));
      });
    });

    group('GetNextPage', () {
      test('supports value equality', () {
        expect(
          GetNextPage(),
          equals(GetNextPage()),
        );
      });

      test('props are correct', () {
        expect(GetNextPage().props, equals(<Object?>[]));
      });
    });

    group('GetGames', () {
      test('supports value equality', () {
        expect(
          const GetGames(2, false),
          equals(const GetGames(2, false)),
        );
      });

      test('props are correct', () {
        expect(const GetGames(2, false).props, equals(<Object?>[2, false]));
      });
    });
  });
}
