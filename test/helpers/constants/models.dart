import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/data/models/parent_platforms_model.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';

const paginationModel = PaginationModel<GameModel>(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

const paginationModelCopy = PaginationModel<GameModel>(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

const paginationDynamicModel = PaginationModel(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

const paginationDynamicModelCopy = PaginationModel(
  count: 853138,
  next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
  previous: null,
  results: [],
);

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

const gameModelCopy = GameModel(
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

const parentPlatformsModel = ParentPlatformsModel(
  platform: parentPlatformModel,
);

const parentPlatformsModelCopy = ParentPlatformsModel(
  platform: parentPlatformModelCopy,
);

const parentPlatformModel = ParentPlatformModel(
  id: 2,
  name: 'PlayStation',
  slug: ParentPlatform.playstation,
);

const parentPlatformModelCopy = ParentPlatformModel(
  id: 2,
  name: 'PlayStation',
  slug: ParentPlatform.playstation,
);

const platformsModel = PlatformsModel(
  platform: platformModel,
  releasedAt: '2013-09-17',
);

const platformsModelCopy = PlatformsModel(
  platform: platformModelCopy,
  releasedAt: '2013-09-17',
);

const platformModel = PlatformModel(
  id: 187,
  name: 'PlayStation 5',
  slug: Platform.playstation5,
);

const platformModelCopy = PlatformModel(
  id: 187,
  name: 'PlayStation 5',
  slug: Platform.playstation5,
);
