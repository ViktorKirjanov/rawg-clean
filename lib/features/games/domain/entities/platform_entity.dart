import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final String? slug;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
      ];
}
