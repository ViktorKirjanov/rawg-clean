import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';

part 'platforms_entity.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
class PlatformsEntity extends Equatable {
  const PlatformsEntity({
    required this.platform,
    this.releasedAt,
  });

  final PlatformModel? platform;
  final String? releasedAt;

  @override
  List<Object?> get props => [
        platform,
        releasedAt,
      ];
}
