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
          .toList(),
    );
