import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platform_entity.dart';

@TypeConverters([ParentPlatformEntityConverter])
class ParentPlatformsEntity extends Equatable {
  const ParentPlatformsEntity({
    required this.platform,
  });

  final ParentPlatformEntity? platform;

  @override
  List<Object?> get props => [
        platform,
      ];
}
