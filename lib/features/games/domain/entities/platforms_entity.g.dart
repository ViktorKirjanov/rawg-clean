// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformsEntity _$PlatformsEntityFromJson(Map<String, dynamic> json) =>
    PlatformsEntity(
      platform: json['platform'] == null
          ? null
          : PlatformModel.fromJson(json['platform'] as Map<String, dynamic>),
      releasedAt: json['released_at'] as String?,
    );

Map<String, dynamic> _$PlatformsEntityToJson(PlatformsEntity instance) =>
    <String, dynamic>{
      'platform': instance.platform?.toJson(),
      'released_at': instance.releasedAt,
    };
