// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_umbraco_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUmbracoResponse<T> _$ApiUmbracoResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiUmbracoResponse<T>(
      contentType: json['contentType'] as String?,
      name: json['name'] as String?,
      createDate: json['createDate'] as String?,
      updateDate: json['updateDate'] as String?,
      id: json['id'] as String?,
      properties: _$nullableGenericFromJson(json['properties'], fromJsonT),
    );

Map<String, dynamic> _$ApiUmbracoResponseToJson<T>(
  ApiUmbracoResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'contentType': instance.contentType,
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
