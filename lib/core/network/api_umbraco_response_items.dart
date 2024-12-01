import 'package:json_annotation/json_annotation.dart'; 

part 'api_umbraco_response_items.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiUmbracoResponseItems {
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'items')
  List<Item>? items;

  ApiUmbracoResponseItems({this.total, this.items});

   factory ApiUmbracoResponseItems.fromJson(Map<String, dynamic> json) => _$ApiUmbracoResponseItemsFromJson(json);

   Map<String, dynamic> toJson() => _$ApiUmbracoResponseItemsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class Item<T> {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'createDate')
  String? createDate;
  @JsonKey(name: 'updateDate')
  String? updateDate;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'properties')
  T? properties;

  Item({
    this.name,
    this.createDate,
    this.updateDate,
    this.id,
    this.properties,
  });

  factory Item.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ItemFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ItemToJson(this, toJsonT);
}
