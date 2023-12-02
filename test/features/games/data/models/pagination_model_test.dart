import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('PaginationModel', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(paginationDynamicModel, isA<PaginationEntity<dynamic>>()),
    );

    test('should supports value comparison', () {
      expect(
        paginationDynamicModel,
        paginationDynamicModelCopy,
      );
    });

    test('should parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/pagination.json')) as Map<String, dynamic>;

      // act
      final result = PaginationModel<dynamic>.fromJson(jsonMap, (json) => null);

      // assert
      expect(
        result,
        paginationDynamicModel,
      );
    });
  });
}
