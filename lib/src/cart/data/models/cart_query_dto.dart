import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../categories/data/models/category_dto.dart';

part 'cart_query_dto.g.dart';

@entity
@JsonSerializable(ignoreUnannotated: false)
class CartQueryDto {
  @primaryKey
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'quantity', defaultValue: 1)
  int? quantity;
  @JsonKey(name: 'image')
  String? image;

  CartQueryDto({this.id, this.title, this.price, this.quantity, this.image});

   factory CartQueryDto.fromJson(Map<String, dynamic> json) => _$CartQueryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CartQueryDtoToJson(this);
}

