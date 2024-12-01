// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutDto _$AboutDtoFromJson(Map<String, dynamic> json) => AboutDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AboutDtoToJson(AboutDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
