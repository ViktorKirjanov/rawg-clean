import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('PlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformEntity, isA<PlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformEntity,
        platformEntityCopy,
      );
    });
  });
}
