import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  group('GameModel', () {
    test(
      'should be a sublass of platform entity',
      () async => expect(gameModel, isA<GameEntity>()),
    );

    test('should supports value comparison', () {
      expect(
        gameModel,
        gameModelCopy,
      );
    });

    test('should parse from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(readJson('/helpers/json/game.json')) as Map<String, dynamic>;

      // act
      final result = GameModel.fromJson(jsonMap);

      // assert
      expect(
        result,
        gameModel,
      );
    });
  });
}
