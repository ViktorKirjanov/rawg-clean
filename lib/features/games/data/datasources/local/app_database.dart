import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/datasources/local/dao/game_dao.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [GameModel],
)
abstract class AppDatabase extends FloorDatabase {
  GameeDao get gameeDao;
}
