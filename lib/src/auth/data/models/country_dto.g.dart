// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) => CountryDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      arName: json['arName'] as String?,
      isSupported: json['isSupported'] as bool?,
      alpha2Code: json['alpha2Code'] as String?,
      alpha3Code: json['alpha3Code'] as String?,
      numericCode: json['numericCode'] as String?,
      flag: json['flag'] as String?,
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$CountryDtoToJson(CountryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'arName': instance.arName,
      'isSupported': instance.isSupported,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'numericCode': instance.numericCode,
      'flag': instance.flag,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
    };
