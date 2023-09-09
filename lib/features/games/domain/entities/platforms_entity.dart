import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:rawg_clean/features/games/data/datasources/local/converters/platform_converter.dart';
import 'package:rawg_clean/features/games/domain/entities/platform_entity.dart';

@TypeConverters([PlatformEntityConverter])
class PlatformsEntity extends Equatable {
  const PlatformsEntity({
    required this.platform,
    this.releasedAt,
  });

  final PlatformEntity? platform;
  final String? releasedAt;

  @override
  List<Object?> get props => [
        platform,
        releasedAt,
      ];
}
