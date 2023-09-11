import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';

part 'pagination_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
  genericArgumentFactories: true,
)
class PaginationModel<T> extends PaginationEntity<T> {
  const PaginationModel({
    super.count,
    super.next,
    super.previous,
    super.results,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationModelFromJson(json, fromJsonT);
}
