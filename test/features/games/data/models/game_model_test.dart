import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/data/models/parent_platforms_model.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const gameModel = GameModel(
    id: 3498,
    slug: 'grand-theft-auto-v',
    name: 'Grand Theft Auto V',
    released: '2013-09-17',
    tba: false,
    backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
    rating: 4.47,
    ratingTop: 5,
    platforms: [
      PlatformsModel(
        platform: PlatformModel(
          id: 187,
          name: 'PlayStation 5',
          slug: Platform.playstation5,
        ),
        releasedAt: '2013-09-17',
      ),
      PlatformsModel(
        platform: PlatformModel(
          id: 186,
          name: 'Xbox Series S/X',
          slug: Platform.xboxSeriesX,
        ),
        releasedAt: '2013-09-17',
      ),
    ],
    parentPlatforms: [
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 1,
          name: 'PC',
          slug: ParentPlatform.pc,
        ),
      ),
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 2,
          name: 'PlayStation',
          slug: ParentPlatform.playstation,
        ),
      ),
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 3,
          name: 'Xbox',
          slug: ParentPlatform.xbox,
        ),
      ),
    ],
  );

  const gameModel2 = GameModel(
    id: 3498,
    slug: 'grand-theft-auto-v',
    name: 'Grand Theft Auto V',
    released: '2013-09-17',
    tba: false,
    backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
    rating: 4.47,
    ratingTop: 5,
    platforms: [
      PlatformsModel(
        platform: PlatformModel(
          id: 187,
          name: 'PlayStation 5',
          slug: Platform.playstation5,
        ),
        releasedAt: '2013-09-17',
      ),
      PlatformsModel(
        platform: PlatformModel(
          id: 186,
          name: 'Xbox Series S/X',
          slug: Platform.xboxSeriesX,
        ),
        releasedAt: '2013-09-17',
      ),
    ],
    parentPlatforms: [
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 1,
          name: 'PC',
          slug: ParentPlatform.pc,
        ),
      ),
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 2,
          name: 'PlayStation',
          slug: ParentPlatform.playstation,
        ),
      ),
      ParentPlatformsModel(
        platform: ParentPlatformModel(
          id: 3,
          name: 'Xbox',
          slug: ParentPlatform.xbox,
        ),
      ),
    ],
  );

  group('PlatformModel', () {
    test(
      'shoule be a sublass of platform entity',
      () async => expect(gameModel, isA<GameModel>()),
    );

    test('shoule supports value comparison', () {
      expect(
        gameModel,
        gameModel2,
      );
    });

    test('shouled parse from json', () async {
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
