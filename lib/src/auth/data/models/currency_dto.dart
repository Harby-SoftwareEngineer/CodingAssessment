import 'package:json_annotation/json_annotation.dart'; 

part 'currency_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CurrencyDto {
  @JsonKey(name: 'disabled')
  bool? disabled;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'selected')
  bool? selected;
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'value')
  String? value;

  CurrencyDto({this.disabled, this.group, this.selected, this.text, this.value});

   factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CurrencyDtoToJson(this);
}

