import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/data/datasources/local/dao/game_dao.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([
  PlatformsEntityConverter,
  PlatformEntityConverter,
  ParentPlatformsEntityConverter,
  ParentPlatformEntityConverter,
])
@Database(
  version: 1,
  entities: [
    GameEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
}
