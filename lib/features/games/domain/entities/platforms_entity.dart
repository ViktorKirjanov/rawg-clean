import 'package:equatable/equatable.dart';
import 'package:rawg_clean/features/games/data/models/platform_model.dart';

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
