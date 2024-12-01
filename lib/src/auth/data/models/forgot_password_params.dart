import 'package:json_annotation/json_annotation.dart'; 

part 'forgot_password_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ForgotPasswordParams {
  @JsonKey(name: 'phone')
  String? phone;

  ForgotPasswordParams({this.phone});

   factory ForgotPasswordParams.fromJson(Map<String, dynamic> json) => _$ForgotPasswordParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ForgotPasswordParamsToJson(this);
}

