// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      released: json['released'] as String?,
      tba: json['tba'] as bool?,
      backgroundImage: json['background_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: (json['rating_top'] as num?)?.toDouble(),
      platforms: (json['platforms'] as List<dynamic>?)
              ?.map((e) => PlatformsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'released': instance.released,
      'tba': instance.tba,
      'background_image': instance.backgroundImage,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'platforms': instance.platforms.map((e) => e.toJson()).toList(),
    };
