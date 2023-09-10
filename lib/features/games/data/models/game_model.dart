import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/models/parent_platforms_model.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';

part 'game_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
)
class GameModel extends GameEntity {
  const GameModel({
    int? id,
    String? slug,
    String? name,
    String? released,
    bool? tba,
    String? backgroundImage,
    double? rating,
    double? ratingTop,
    List<PlatformsModel>? platforms,
    List<ParentPlatformsModel>? parentPlatforms,
  }) : super(
          id: id,
          slug: slug,
          name: name,
          released: released,
          tba: tba,
          backgroundImage: backgroundImage,
          rating: rating,
          ratingTop: ratingTop,
          platforms: platforms ?? const [],
          parentPlatforms: parentPlatforms ?? const [],
        );

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
        platforms: game.platforms as List<PlatformsModel>,
        parentPlatforms: game.parentPlatforms as List<ParentPlatformsModel>,
      );
}
