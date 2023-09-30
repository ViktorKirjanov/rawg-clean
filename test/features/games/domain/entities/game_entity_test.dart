import 'package:flutter_test/flutter_test.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

void main() {
  test('supports value comparison', () {
    expect(
      const GameEntity(
        id: 3498,
        slug: 'grand-theft-auto-v',
        name: 'Grand Theft Auto V',
        released: '2013-09-17',
        tba: false,
        backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
        rating: 4.47,
        ratingTop: 5,
        platforms: [
          PlatformsEntity(
            platform: PlatformEntity(
              id: 187,
              name: 'PlayStation 5',
              slug: Platform.playstation5,
            ),
            releasedAt: '2013-09-17',
          ),
          PlatformsEntity(
            platform: PlatformEntity(
              id: 186,
              name: 'Xbox Series S/X',
              slug: Platform.xboxSeriesX,
            ),
            releasedAt: '2013-09-17',
          ),
        ],
        parentPlatforms: [
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 1,
              name: 'PC',
              slug: ParentPlatform.pc,
            ),
          ),
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 2,
              name: 'PlayStation',
              slug: ParentPlatform.playstation,
            ),
          ),
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 3,
              name: 'Xbox',
              slug: ParentPlatform.xbox,
            ),
          ),
        ],
      ),
      const GameEntity(
        id: 3498,
        slug: 'grand-theft-auto-v',
        name: 'Grand Theft Auto V',
        released: '2013-09-17',
        tba: false,
        backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
        rating: 4.47,
        ratingTop: 5,
        platforms: [
          PlatformsEntity(
            platform: PlatformEntity(
              id: 187,
              name: 'PlayStation 5',
              slug: Platform.playstation5,
            ),
            releasedAt: '2013-09-17',
          ),
          PlatformsEntity(
            platform: PlatformEntity(
              id: 186,
              name: 'Xbox Series S/X',
              slug: Platform.xboxSeriesX,
            ),
            releasedAt: '2013-09-17',
          ),
        ],
        parentPlatforms: [
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 1,
              name: 'PC',
              slug: ParentPlatform.pc,
            ),
          ),
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 2,
              name: 'PlayStation',
              slug: ParentPlatform.playstation,
            ),
          ),
          ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: 3,
              name: 'Xbox',
              slug: ParentPlatform.xbox,
            ),
          ),
        ],
      ),
    );
  });
}
