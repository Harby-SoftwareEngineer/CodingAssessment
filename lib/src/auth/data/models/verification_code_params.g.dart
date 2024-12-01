// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCodeParams _$VerificationCodeParamsFromJson(
        Map<String, dynamic> json) =>
    VerificationCodeParams(
      code: json['otp'] as String?,
      phoneNumber: json['phone'] as String?,
    );

Map<String, dynamic> _$VerificationCodeParamsToJson(
        VerificationCodeParams instance) =>
    <String, dynamic>{
      'otp': instance.code,
      'phone': instance.phoneNumber,
    };
