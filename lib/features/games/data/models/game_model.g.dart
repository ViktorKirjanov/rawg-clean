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
      backgroundImage: json['backgroundImage'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: (json['ratingTop'] as num?)?.toDouble(),
    );
