import 'package:json_annotation/json_annotation.dart'; 

part 'about_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AboutDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  AboutDto({this.id, this.name, this.description});

   factory AboutDto.fromJson(Map<String, dynamic> json) => _$AboutDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AboutDtoToJson(this);
}

