import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

part 'game_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class GameModel extends GameEntity {
  const GameModel({
    super.id,
    super.slug,
    super.name,
    super.released,
    super.tba,
    super.backgroundImage,
    super.rating,
    super.ratingTop,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
}
