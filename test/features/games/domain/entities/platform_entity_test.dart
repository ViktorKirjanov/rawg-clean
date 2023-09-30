import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';

void main() {
  const platformEntity = PlatformEntity(
    id: 187,
    name: 'PlayStation 5',
    slug: Platform.playstation5,
  );

  const platformEntity2 = PlatformEntity(
    id: 187,
    name: 'PlayStation 5',
    slug: Platform.playstation5,
  );

  group('PlatformEntity', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformEntity, isA<PlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformEntity,
        platformEntity2,
      );
    });
  });
}
