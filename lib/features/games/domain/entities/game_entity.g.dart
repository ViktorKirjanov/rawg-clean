// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameEntity _$GameEntityFromJson(Map<String, dynamic> json) => GameEntity(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      released: json['released'] as String?,
      tba: json['tba'] as bool?,
      backgroundImage: json['background_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: (json['rating_top'] as num?)?.toDouble(),
    );
