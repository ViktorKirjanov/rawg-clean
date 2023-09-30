import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('ParentPlatformsEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(parentPlatformsEntity, isA<ParentPlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        parentPlatformsEntity,
        parentPlatformsEntityCopy,
      );
    });
  });
}
