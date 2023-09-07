import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

part 'game_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
@Entity(
  tableName: 'game',
  primaryKeys: ['id'],
)
@TypeConverters([PlatformsModelConverter])
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
    super.platforms,
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
        platforms: game.platforms,
      );

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
