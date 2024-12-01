// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsDto _$ContactUsDtoFromJson(Map<String, dynamic> json) => ContactUsDto(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      contactForm: json['contactForm'] == null
          ? null
          : MarkupDto.fromJson(json['contactForm'] as Map<String, dynamic>),
      contactAddress: json['contactAddress'] as String?,
      contactMap: json['contactMap'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactWhatsApp: json['contactWhatsApp'] as String?,
    );

Map<String, dynamic> _$ContactUsDtoToJson(ContactUsDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'contactForm': instance.contactForm,
      'contactAddress': instance.contactAddress,
      'contactMap': instance.contactMap,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'contactWhatsApp': instance.contactWhatsApp,
    };
