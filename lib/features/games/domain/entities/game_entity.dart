import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

@TypeConverters([
  PlatformsEntityConverter,
  ParentPlatformsEntityConverter,
])
@Entity(
  tableName: 'game',
  primaryKeys: ['id'],
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
    this.parentPlatforms = const [],
  });

  final int? id;
  final String? slug;
  final String? name;
  final String? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final double? ratingTop;
  final List<PlatformsEntity> platforms;
  final List<ParentPlatformsEntity> parentPlatforms;

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
        parentPlatforms,
      ];
}
