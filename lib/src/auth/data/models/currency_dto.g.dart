// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
      disabled: json['disabled'] as bool?,
      group: json['group'] as String?,
      selected: json['selected'] as bool?,
      text: json['text'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CurrencyDtoToJson(CurrencyDto instance) =>
    <String, dynamic>{
      'disabled': instance.disabled,
      'group': instance.group,
      'selected': instance.selected,
      'text': instance.text,
      'value': instance.value,
    };
