import 'package:json_annotation/json_annotation.dart'; 

part 'api_umbraco_response.g.dart'; 

@JsonSerializable(genericArgumentFactories: true)
class ApiUmbracoResponse<T> {
  @JsonKey(name: 'contentType')
  String? contentType;
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

  ApiUmbracoResponse({this.contentType, this.name, this.createDate, this.updateDate, this.id, this.properties});


  factory ApiUmbracoResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) toJsonT,
      ) => _$ApiUmbracoResponseFromJson(json, toJsonT);
}


