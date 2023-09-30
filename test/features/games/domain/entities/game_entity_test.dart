import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('GameEntity', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(gameEntity, isA<GameEntity>()),
    );
    test('supports value comparison', () {
      expect(
        gameEntity,
        gameEntityCopy,
      );
    });
  });
}
