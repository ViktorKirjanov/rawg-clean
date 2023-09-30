import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

void main() {
  const platformsEntity = ParentPlatformsEntity(
    platform: ParentPlatformEntity(
      id: 2,
      name: 'PlayStation',
      slug: ParentPlatform.playstation,
    ),
  );

  const platformsEntity2 = ParentPlatformsEntity(
    platform: ParentPlatformEntity(
      id: 2,
      name: 'PlayStation',
      slug: ParentPlatform.playstation,
    ),
  );

  group('ParentPlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformsEntity, isA<ParentPlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformsEntity,
        platformsEntity2,
      );
    });
  });
}
