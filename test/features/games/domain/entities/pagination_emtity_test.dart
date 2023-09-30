import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

void main() {
  const paginationEntity = PaginationEntity(
    count: 853138,
    next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
    previous: null,
    results: [],
  );

  const paginationEntity2 = PaginationEntity(
    count: 853138,
    next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
    previous: null,
    results: [],
  );

  group('PlatformEntity', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(paginationEntity, isA<PaginationEntity<dynamic>>()),
    );

    test('should supports value comparison', () {
      expect(
        paginationEntity,
        paginationEntity2,
      );
    });
  });
}
