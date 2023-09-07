import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';

part 'game_entity.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
class GameEntity extends Equatable {
  const GameEntity({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.platforms = const [],
  });

  final int? id;
  final String? slug;
  final String? name;
  final String? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final double? ratingTop;
  final List<PlatformsModel> platforms;

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        rating,
        ratingTop,
        platforms,
      ];
}
