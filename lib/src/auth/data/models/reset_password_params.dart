import 'package:json_annotation/json_annotation.dart'; 

part 'reset_password_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ResetPasswordParams {
  @JsonKey(name: 'new_password')
  String? newPassword;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'new_password_confirmation')
  String? newPasswordConfirmation;
  @JsonKey(name: 'otp')
  String? otp;

  ResetPasswordParams({this.newPassword,this.otp, this.newPasswordConfirmation, this.phone});

   factory ResetPasswordParams.fromJson(Map<String, dynamic> json) => _$ResetPasswordParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ResetPasswordParamsToJson(this);
}

