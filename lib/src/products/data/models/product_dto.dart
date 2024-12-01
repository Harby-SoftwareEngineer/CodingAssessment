import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../categories/data/models/category_dto.dart';

part 'product_dto.g.dart';


@JsonSerializable(ignoreUnannotated: false)
class ProductDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'creationAt')
  String? creationAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'category')
  CategoryDto? category;

  ProductDto({this.id, this.title, this.price, this.description, this.images, this.creationAt, this.updatedAt, this.category});

   factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

