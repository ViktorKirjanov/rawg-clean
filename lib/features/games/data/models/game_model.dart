import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

part 'game_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
)
@Entity(tableName: 'game', primaryKeys: ['id'])
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

  factory GameModel.fromEntity(GameEntity game) => GameModel(
        id: game.id,
        slug: game.slug,
        name: game.name,
        released: game.released,
        tba: game.tba,
        backgroundImage: game.backgroundImage,
        rating: game.rating,
        ratingTop: game.ratingTop,
      );
}
