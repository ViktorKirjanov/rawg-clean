import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

void main() {
  const platformsEntity = PlatformsEntity(
    platform: PlatformEntity(
      id: 187,
      name: 'PlayStation 5',
      slug: Platform.playstation5,
    ),
    releasedAt: '2013-09-17',
  );

  const platformsEntity2 = PlatformsEntity(
    platform: PlatformEntity(
      id: 187,
      name: 'PlayStation 5',
      slug: Platform.playstation5,
    ),
    releasedAt: '2013-09-17',
  );

  group('PlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformsEntity, isA<PlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformsEntity,
        platformsEntity2,
      );
    });
  });
}
