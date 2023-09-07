import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

part 'platforms_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
@TypeConverters([PlatformModelConverter])
class PlatformsModel extends PlatformsEntity {
  const PlatformsModel({
    required super.platform,
    super.releasedAt,
  });

  factory PlatformsModel.fromJson(Map<String, dynamic> json) => _$PlatformsModelFromJson(json);

  factory PlatformsModel.fromEntity(PlatformsEntity platforms) => PlatformsModel(
        platform: platforms.platform,
        releasedAt: platforms.releasedAt,
      );

  Map<String, dynamic> toJson() => _$PlatformsModelToJson(this);
}
