// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunicationDto _$CommunicationDtoFromJson(Map<String, dynamic> json) =>
    CommunicationDto(
      id: (json['id'] as num?)?.toInt(),
      Linkedin: json['Linkedin'] as String?,
      Facebook: json['Facebook'] as String?,
      Telegram: json['Telegram'] as String?,
      Whatsapp: json['Whatsapp'] as String?,
      Google: json['Google'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CommunicationDtoToJson(CommunicationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Linkedin': instance.Linkedin,
      'Facebook': instance.Facebook,
      'Telegram': instance.Telegram,
      'Whatsapp': instance.Whatsapp,
      'Google': instance.Google,
      'updated_at': instance.updatedAt,
    };
