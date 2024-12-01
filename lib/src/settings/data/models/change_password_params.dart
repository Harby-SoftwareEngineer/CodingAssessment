import 'package:json_annotation/json_annotation.dart'; 

part 'change_password_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ChangePasswordParams {
  @JsonKey(name: 'old_password')
  String? oldPassword;
  @JsonKey(name: 'new_password')
  String? newPassword;
  @JsonKey(name: 'new_password_confirmation')
  String? newPasswordConfirmation;

  ChangePasswordParams({this.oldPassword,this.newPassword, this.newPasswordConfirmation});

   factory ChangePasswordParams.fromJson(Map<String, dynamic> json) => _$ChangePasswordParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ChangePasswordParamsToJson(this);
}

