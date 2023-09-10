import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/data/models/parent_platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const platformsModel = ParentPlatformsModel(
    platform: ParentPlatformModel(
      id: 2,
      name: 'PlayStation',
      slug: ParentPlatform.playstation,
    ),
  );

  const platformsModel2 = ParentPlatformsModel(
    platform: ParentPlatformModel(
      id: 2,
      name: 'PlayStation',
      slug: ParentPlatform.playstation,
    ),
  );

  group('ParentPlatformModel', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(platformsModel, isA<ParentPlatformsEntity>()),
    );

    test('shoule supports value comparison', () {
      expect(
        platformsModel,
        platformsModel2,
      );
    });

    test('shouled parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/parent_platforms.json')) as Map<String, dynamic>;

      // act
      final result = ParentPlatformsModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        platformsModel,
      );
    });
  });
}
