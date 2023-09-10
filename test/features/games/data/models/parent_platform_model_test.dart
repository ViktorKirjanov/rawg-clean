import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const platformModel = ParentPlatformModel(
    id: 2,
    name: 'PlayStation',
    slug: ParentPlatform.playstation,
  );

  const platformModel2 = ParentPlatformModel(
    id: 2,
    name: 'PlayStation',
    slug: ParentPlatform.playstation,
  );

  group('ParentPlatformModel', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(platformModel, isA<ParentPlatformEntity>()),
    );

    test('shoule supports value comparison', () {
      expect(
        platformModel,
        platformModel2,
      );
    });

    test('shouled parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/parent_platform.json')) as Map<String, dynamic>;

      // act
      final result = ParentPlatformModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        platformModel,
      );
    });
  });
}
