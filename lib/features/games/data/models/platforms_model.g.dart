// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformsModel _$PlatformsModelFromJson(Map<String, dynamic> json) =>
    PlatformsModel(
      platform: json['platform'] == null
          ? null
          : PlatformModel.fromJson(json['platform'] as Map<String, dynamic>),
      releasedAt: json['released_at'] as String?,
    );

Map<String, dynamic> _$PlatformsModelToJson(PlatformsModel instance) =>
    <String, dynamic>{
      'platform': instance.platform?.toJson(),
      'released_at': instance.releasedAt,
    };
