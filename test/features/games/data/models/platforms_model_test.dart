import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const platformsModel = PlatformsModel(
    platform: PlatformModel(
      id: 187,
      name: 'PlayStation 5',
      slug: Platform.playstation5,
    ),
    releasedAt: '2013-09-17',
  );

  const platformsModel2 = PlatformsModel(
    platform: PlatformModel(
      id: 187,
      name: 'PlayStation 5',
      slug: Platform.playstation5,
    ),
    releasedAt: '2013-09-17',
  );

  group('PlatformModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformsModel, isA<PlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformsModel,
        platformsModel2,
      );
    });

    test('should parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/platforms.json')) as Map<String, dynamic>;

      // act
      final result = PlatformsModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        platformsModel,
      );
    });
  });
}
