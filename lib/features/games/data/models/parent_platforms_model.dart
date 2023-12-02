import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/models/parent_platform_model.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

part 'parent_platforms_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
)
class ParentPlatformsModel extends ParentPlatformsEntity {
  const ParentPlatformsModel({
    ParentPlatformModel? platform,
  }) : super(
          platform: platform,
        );

  factory ParentPlatformsModel.fromJson(Map<String, dynamic> json) => _$ParentPlatformsModelFromJson(json);

  factory ParentPlatformsModel.fromEntity(ParentPlatformsEntity platforms) => ParentPlatformsModel(
        platform: platforms.platform as ParentPlatformModel,
      );
}
