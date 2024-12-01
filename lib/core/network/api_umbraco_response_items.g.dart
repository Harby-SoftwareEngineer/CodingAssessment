// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_umbraco_response_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUmbracoResponseItems _$ApiUmbracoResponseItemsFromJson(
        Map<String, dynamic> json) =>
    ApiUmbracoResponseItems(
      total: (json['total'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item<dynamic>.fromJson(
              e as Map<String, dynamic>, (value) => value))
          .toList(),
    );

Map<String, dynamic> _$ApiUmbracoResponseItemsToJson(
        ApiUmbracoResponseItems instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items
          ?.map((e) => e.toJson(
                (value) => value,
              ))
          .toList(),
    };

Item<T> _$ItemFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Item<T>(
      name: json['name'] as String?,
      createDate: json['createDate'] as String?,
      updateDate: json['updateDate'] as String?,
      id: json['id'] as String?,
      properties: _$nullableGenericFromJson(json['properties'], fromJsonT),
    );

Map<String, dynamic> _$ItemToJson<T>(
  Item<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'name': instance.name,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'id': instance.id,
      'properties': _$nullableGenericToJson(instance.properties, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
