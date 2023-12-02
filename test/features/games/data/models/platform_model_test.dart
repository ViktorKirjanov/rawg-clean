import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('PlatformModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(platformModel, isA<PlatformEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        platformModel,
        platformModelCopy,
      );
    });

    test('should parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(readJson('/helpers/json/platform.json')) as Map<String, dynamic>;

      // act
      final result = PlatformModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        platformModel,
      );
    });
  });
}
