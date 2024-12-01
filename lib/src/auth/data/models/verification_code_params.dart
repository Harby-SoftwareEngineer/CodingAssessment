import 'package:json_annotation/json_annotation.dart'; 

part 'verification_code_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class VerificationCodeParams {
  @JsonKey(name: 'otp')
  String? code;
  @JsonKey(name: 'phone')
  String? phoneNumber;

  VerificationCodeParams({this.code, this.phoneNumber});

   factory VerificationCodeParams.fromJson(Map<String, dynamic> json) => _$VerificationCodeParamsFromJson(json);

   Map<String, dynamic> toJson() => _$VerificationCodeParamsToJson(this);
}

