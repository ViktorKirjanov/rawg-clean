import 'dart:convert';
import 'dart:developer';

import 'package:floor/floor.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/core/util/enum_helper.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

class PlatformsEntityConverter extends TypeConverter<List<PlatformsEntity>, String> {
  @override
  List<PlatformsEntity> decode(String databaseValue) {
    final List<dynamic> list = json.decode(databaseValue) as List<dynamic>;

    try {
      return List<PlatformsEntity>.from(
        list.map((i) {
          final platforms = i as Map<String, dynamic>;
          final Map<String, dynamic> platform = platforms['platform'] as Map<String, dynamic>;
          return PlatformsEntity(
            platform: PlatformEntity(
              id: platform['id'] as int,
              name: platform['name'] as String,
              slug: EnumHelper.stringToEnum(Platform.values, platform['slug'] as String),
            ),
            releasedAt: platforms.containsKey('released_at') ? platforms['released_at'] as String? : null,
          );
        }),
      );
    } catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      throw Exception();
    }
  }

  @override
  String encode(List<PlatformsEntity> value) {
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

class PlatformEntityConverter extends TypeConverter<PlatformEntity, String> {
  @override
  PlatformEntity decode(String databaseValue) {
    final Map<String, dynamic> map = json.decode(databaseValue) as Map<String, dynamic>;
    return PlatformEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: EnumHelper.stringToEnum(Platform.values, map['slug'] as String),
    );
  }

  @override
  String encode(PlatformEntity value) {
    final Map<String, dynamic> map = {
      'id': value.id,
      'name': value.name,
      'slug': EnumHelper.enumToString(value.slug),
    };
    return json.encode(map);
  }
}

class ParentPlatformsEntityConverter extends TypeConverter<List<ParentPlatformsEntity>, String> {
  @override
  List<ParentPlatformsEntity> decode(String databaseValue) {
    final List<dynamic> list = json.decode(databaseValue) as List<dynamic>;

    try {
      return List<ParentPlatformsEntity>.from(
        list.map((i) {
          final platforms = i as Map<String, dynamic>;
          final Map<String, dynamic> platform = platforms['platform'] as Map<String, dynamic>;
          return ParentPlatformsEntity(
            platform: ParentPlatformEntity(
              id: platform['id'] as int,
              name: platform['name'] as String,
              slug: EnumHelper.stringToEnum(ParentPlatform.values, platform['slug'] as String),
            ),
          );
        }),
      );
    } catch (error, stackTrace) {
      log('🐞Error: $error', stackTrace: stackTrace);
      throw Exception();
    }
  }

  @override
  String encode(List<ParentPlatformsEntity> value) {
    final List<Map<String, dynamic>> list = value
        .map(
          (i) => {
            'platform': {
              'id': i.platform?.id,
              'name': i.platform?.name,
              'slug': EnumHelper.enumToString(i.platform?.slug),
            },
          },
        )
        .toList();
    return json.encode(list);
  }
}

class ParentPlatformEntityConverter extends TypeConverter<ParentPlatformEntity, String> {
  @override
  ParentPlatformEntity decode(String databaseValue) {
    final Map<String, dynamic> map = json.decode(databaseValue) as Map<String, dynamic>;
    return ParentPlatformEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: EnumHelper.stringToEnum(ParentPlatform.values, map['slug'] as String),
    );
  }

  @override
  String encode(ParentPlatformEntity value) {
    final Map<String, dynamic> map = {
      'id': value.id,
      'name': value.name,
      'slug': EnumHelper.enumToString(value.slug),
    };
    return json.encode(map);
  }
}
