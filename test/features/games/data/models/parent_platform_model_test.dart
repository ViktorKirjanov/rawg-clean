import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('ParentPlatformModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(parentPlatformModel, isA<ParentPlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        parentPlatformModel,
        parentPlatformModelCopy,
      );
    });

    test('should parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/parent_platform.json')) as Map<String, dynamic>;

      // act
      final result = ParentPlatformModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        parentPlatformModel,
      );
    });
  });
}
