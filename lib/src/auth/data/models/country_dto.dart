import 'package:json_annotation/json_annotation.dart'; 

part 'country_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CountryDto {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'arName')
  String? arName;
  @JsonKey(name: 'isSupported')
  bool? isSupported;
  @JsonKey(name: 'alpha2Code')
  String? alpha2Code;
  @JsonKey(name: 'alpha3Code')
  String? alpha3Code;
  @JsonKey(name: 'numericCode')
  String? numericCode;
  @JsonKey(name: 'flag')
  String? flag;
  @JsonKey(name: 'createdDate')
  String? createdDate;
  @JsonKey(name: 'updatedDate')
  String? updatedDate;
  @JsonKey(name: 'createdBy')
  String? createdBy;
  @JsonKey(name: 'updatedBy')
  String? updatedBy;

  CountryDto({this.id, this.name, this.arName, this.isSupported, this.alpha2Code, this.alpha3Code, this.numericCode, this.flag, this.createdDate, this.updatedDate, this.createdBy, this.updatedBy});

   factory CountryDto.fromJson(Map<String, dynamic> json) => _$CountryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CountryDtoToJson(this);
}

