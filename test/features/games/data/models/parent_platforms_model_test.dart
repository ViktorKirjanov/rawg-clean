import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/parent_platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('ParentPlatformsModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(parentPlatformsModel, isA<ParentPlatformsEntity>()),
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
          json.decode(readJson('/helpers/json/parent_platforms.json')) as Map<String, dynamic>;

      // act
      final result = ParentPlatformsModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        parentPlatformsModel,
      );
    });
  });
}
