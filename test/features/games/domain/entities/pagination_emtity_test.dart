import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

import '../../../../helpers/constants/entities.dart';

void main() {
  group('PaginationEntity', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(paginationEntity, isA<PaginationEntity<dynamic>>()),
    );

    test('should supports value comparison', () {
      expect(
        paginationEntity,
        paginationEntityCopy,
      );
    });
  });
}
