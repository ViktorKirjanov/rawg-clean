import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('PlatformsEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformsEntity, isA<PlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformsEntity,
        platformsEntityCopy,
      );
    });
  });
}
