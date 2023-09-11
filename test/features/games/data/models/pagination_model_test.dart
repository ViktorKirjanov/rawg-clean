import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const paginationModel = PaginationModel(
    count: 853138,
    next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
    previous: null,
    results: [],
  );

  const paginationModel2 = PaginationModel(
    count: 853138,
    next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
    previous: null,
    results: [],
  );

  group('PlatformModel', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(paginationModel, isA<PaginationEntity<dynamic>>()),
    );

    test('shoule supports value comparison', () {
      expect(
        paginationModel,
        paginationModel2,
      );
    });

    test('shouled parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('/helpers/json/pagination.json')) as Map<String, dynamic>;

      // act
      final result = PaginationModel<dynamic>.fromJson(jsonMap, (json) => null);

      // assert
      expect(
        result,
        paginationModel,
      );
    });
  });
}
