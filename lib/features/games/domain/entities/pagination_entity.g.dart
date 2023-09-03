// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationEntity<T> _$PaginationEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationEntity<T>(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );
