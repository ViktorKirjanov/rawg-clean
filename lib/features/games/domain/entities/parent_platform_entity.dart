import 'package:equatable/equatable.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';

class ParentPlatformEntity extends Equatable {
  const ParentPlatformEntity({
    this.id,
    this.slug,
    this.name,
  });

  final int? id;
  final ParentPlatform? slug;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
      ];
}
