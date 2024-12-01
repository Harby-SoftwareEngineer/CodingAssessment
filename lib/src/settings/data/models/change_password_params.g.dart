// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordParams _$ChangePasswordParamsFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordParams(
      oldPassword: json['old_password'] as String?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation: json['new_password_confirmation'] as String?,
    );

Map<String, dynamic> _$ChangePasswordParamsToJson(
        ChangePasswordParams instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
    };
