import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

void main() {
  const platformEntity = ParentPlatformEntity(
    id: 2,
    name: 'PlayStation',
    slug: ParentPlatform.playstation,
  );

  const platformEntity2 = ParentPlatformEntity(
    id: 2,
    name: 'PlayStation',
    slug: ParentPlatform.playstation,
  );

  group('ParentPlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformEntity, isA<ParentPlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformEntity,
        platformEntity2,
      );
    });
  });
}
