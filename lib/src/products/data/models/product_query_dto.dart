import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../categories/data/models/category_dto.dart';

part 'product_query_dto.g.dart';

@Entity(tableName: 'products')
@JsonSerializable(ignoreUnannotated: false)
class ProductQueryDto {
  @PrimaryKey()
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'images')
  String? images;
  @JsonKey(name: 'creationAt')
  String? creationAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'category')
  String? category;

  ProductQueryDto({this.id, this.title, this.price, this.description, this.images, this.creationAt, this.updatedAt, this.category});

   factory ProductQueryDto.fromJson(Map<String, dynamic> json) => _$ProductQueryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProductQueryDtoToJson(this);
}

