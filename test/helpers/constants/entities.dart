import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

const paginationEntity = PaginationEntity(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

const paginationEntityCopy = PaginationEntity(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

const paginationEntityResult = PaginationEntity(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [gameEntity],
);

const gameEntity = GameEntity(
  id: 3498,
  slug: 'grand-theft-auto-v',
  name: 'Grand Theft Auto V',
  released: '2013-09-17',
  tba: false,
  backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
  rating: 4.47,
  ratingTop: 5,
  platforms: [
    platformsEntity,
  ],
);

const gameEntityCopy = GameEntity(
  id: 3498,
  slug: 'grand-theft-auto-v',
  name: 'Grand Theft Auto V',
  released: '2013-09-17',
  tba: false,
  backgroundImage: 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg',
  rating: 4.47,
  ratingTop: 5,
  platforms: [
    platformsEntityCopy,
  ],
);

const parentPlatformsEntity = ParentPlatformsEntity(
  platform: parentPlatformEntity,
);

const parentPlatformsEntityCopy = ParentPlatformsEntity(
  platform: parentPlatformEntityCopy,
);

const parentPlatformEntity = ParentPlatformEntity(
  id: 2,
  name: 'PlayStation',
  slug: ParentPlatform.playstation,
);

const parentPlatformEntityCopy = ParentPlatformEntity(
  id: 2,
  name: 'PlayStation',
  slug: ParentPlatform.playstation,
);

const platformsEntity = PlatformsEntity(
  platform: platformEntity,
  releasedAt: '2013-09-17',
);

const platformsEntityCopy = PlatformsEntity(
  platform: platformEntityCopy,
  releasedAt: '2013-09-17',
);

const platformEntity = PlatformEntity(
  id: 187,
  name: 'PlayStation 5',
  slug: Platform.playstation5,
);

const platformEntityCopy = PlatformEntity(
  id: 187,
  name: 'PlayStation 5',
  slug: Platform.playstation5,
);
