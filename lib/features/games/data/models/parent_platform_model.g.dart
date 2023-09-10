// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_platform_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentPlatformModel _$ParentPlatformModelFromJson(Map<String, dynamic> json) =>
    ParentPlatformModel(
      id: json['id'] as int?,
      slug: $enumDecodeNullable(_$ParentPlatformEnumMap, json['slug']),
      name: json['name'] as String?,
    );

const _$ParentPlatformEnumMap = {
  ParentPlatform.pc: 'pc',
  ParentPlatform.playstation: 'playstation',
  ParentPlatform.xbox: 'xbox',
  ParentPlatform.ios: 'ios',
  ParentPlatform.android: 'android',
  ParentPlatform.mac: 'mac',
  ParentPlatform.linux: 'linux',
  ParentPlatform.nintendo: 'nintendo',
  ParentPlatform.atari: 'atari',
  ParentPlatform.commodoreAmiga: 'commodore-amiga',
};
