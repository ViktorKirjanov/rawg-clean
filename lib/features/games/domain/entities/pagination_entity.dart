import 'package:equatable/equatable.dart';

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
