import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

part 'parent_platform_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
)
class ParentPlatformModel extends ParentPlatformEntity {
  const ParentPlatformModel({
    super.id,
    super.slug,
    super.name,
  });

  factory ParentPlatformModel.fromJson(Map<String, dynamic> json) => _$ParentPlatformModelFromJson(json);

  factory ParentPlatformModel.fromEntity(ParentPlatformEntity platform) => ParentPlatformModel(
        id: platform.id,
        slug: platform.slug,
        name: platform.name,
      );
}
