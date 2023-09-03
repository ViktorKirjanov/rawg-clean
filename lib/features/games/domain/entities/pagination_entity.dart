import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_entity.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createToJson: false,
  genericArgumentFactories: true,
)
class PaginationEntity<T> extends Equatable {
  const PaginationEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<T>? results;

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
