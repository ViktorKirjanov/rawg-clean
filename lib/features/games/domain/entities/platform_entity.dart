import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';

part 'platform_entity.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: true,
)
class PlatformEntity extends Equatable {
  const PlatformEntity({
    this.id,
    this.slug,
    this.name,
  });

  final int? id;
  final Platform? slug;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
      ];
}
