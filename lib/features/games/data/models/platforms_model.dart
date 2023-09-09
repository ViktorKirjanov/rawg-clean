import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/platforms_entity.dart';

part 'platforms_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
)
class PlatformsModel extends PlatformsEntity {
  const PlatformsModel({
    PlatformModel? platform,
    String? releasedAt,
  }) : super(
          platform: platform,
          releasedAt: releasedAt,
        );

  factory PlatformsModel.fromJson(Map<String, dynamic> json) => _$PlatformsModelFromJson(json);

  factory PlatformsModel.fromEntity(PlatformsEntity platforms) => PlatformsModel(
        platform: platforms.platform as PlatformModel,
        releasedAt: platforms.releasedAt,
      );
}
