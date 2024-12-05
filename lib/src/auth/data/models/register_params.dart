import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'register_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class RegisterParams {
  @JsonKey(name: 'displayName')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;

  RegisterParams({this.name, this.email, this.password});

  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

