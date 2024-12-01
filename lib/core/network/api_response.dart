import 'package:app/core/network/pagination.dart';
import 'package:json_annotation/json_annotation.dart';


part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  // String? status;
  int? code;
  String? message;
  Pagination? pagination;
  T? result;


  ApiResponse({this.code, this.message, this.result, this.pagination});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) toJsonT,
  ) => _$ApiResponseFromJson(json, toJsonT);
}



