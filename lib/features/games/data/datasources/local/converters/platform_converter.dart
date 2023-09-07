import 'dart:convert';
import 'dart:developer';

import 'package:floor/floor.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/core/util/enum_helper.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';

class PlatformsModelConverter extends TypeConverter<List<PlatformsModel>, String> {
  @override
  List<PlatformsModel> decode(String databaseValue) {
    final List<dynamic> list = json.decode(databaseValue) as List<dynamic>;

    try {
      return List<PlatformsModel>.from(
        list.map((i) {
          final platforms = i as Map<String, dynamic>;
          final Map<String, dynamic> platform = platforms['platform'] as Map<String, dynamic>;
          return PlatformsModel(
            platform: PlatformModel(
              id: platform['id'] as int,
              name: platform['name'] as String,
              slug: EnumHelper.stringToEnum(Platform.values, platform['slug'] as String),
            ),
            releasedAt: platforms['released_at'] as String,
          );
        }),
      );
    } catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      throw Exception();
    }
  }

  @override
  String encode(List<PlatformsModel> value) {
    final List<Map<String, dynamic>> list = value
        .map(
          (i) => {
            'platform': {
              'id': i.platform?.id,
              'name': i.platform?.name,
              'slug': EnumHelper.enumToString(i.platform?.slug),
            },
            'released_at': i.releasedAt,
          },
        )
        .toList();
    return json.encode(list);
  }
}

class PlatformModelConverter extends TypeConverter<PlatformModel, String> {
  @override
  PlatformModel decode(String databaseValue) {
    final Map<String, dynamic> map = json.decode(databaseValue) as Map<String, dynamic>;
    return PlatformModel(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: EnumHelper.stringToEnum(Platform.values, map['slug'] as String),
    );
  }

  @override
  String encode(PlatformModel value) {
    final Map<String, dynamic> map = {
      'id': value.id,
      'name': value.name,
      'slug': EnumHelper.enumToString(value.slug),
    };
    return json.encode(map);
  }
}
