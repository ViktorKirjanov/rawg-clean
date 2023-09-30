import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('PlatformsModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformsModel, isA<PlatformsEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        parentPlatformsModel,
        parentPlatformsModelCopy,
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
