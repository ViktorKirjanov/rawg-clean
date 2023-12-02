import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('ParentPlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(parentPlatformEntity, isA<ParentPlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        parentPlatformEntity,
        parentPlatformEntityCopy,
      );
    });
  });
}
