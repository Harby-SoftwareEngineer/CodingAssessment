import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@entity
@JsonSerializable(ignoreUnannotated: false)
class CategoryDto {
  @primaryKey
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'creationAt')
  String? creationAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  CategoryDto({this.id, this.name, this.image, this.creationAt, this.updatedAt});

   factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

