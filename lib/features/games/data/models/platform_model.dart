import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';

part 'platform_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
class PlatformModel extends PlatformEntity {
  const PlatformModel({
    super.id,
    super.slug,
    super.name,
  });

  factory PlatformModel.fromJson(Map<String, dynamic> json) => _$PlatformModelFromJson(json);

  factory PlatformModel.fromEntity(PlatformEntity platform) => PlatformModel(
        id: platform.id,
        slug: platform.slug,
        name: platform.name,
      );

  Map<String, dynamic> toJson() => _$PlatformModelToJson(this);
}
