// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) =>
    RegisterParams(
      password: json['Password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      idType: json['IdType'] as String?,
      idNumber: json['IdNumber'] as String?,
      fullName: json['FullName'] as String?,
      fullNameAr: json['FullNameAr'] as String?,
      address: json['Address'] as String?,
      createdBy: json['CreatedBy'] as String?,
      passportFile: _$JsonConverterFromJson<String, File>(
          json['File'], const FileConverter().fromJson),
      googleRecaptchaResponse: json['GoogleRecaptchaResponse'] as String?,
      firebaseDeviceId: json['FirebaseDeviceId'] as String?,
      signture: json['Signture'] as String?,
      accountCategory: json['AccountCategory'] as String?,
      accountType: json['AccountType'] as String?,
      gender: json['Gender'] as String?,
      birthDate: json['BirthDate'] as String?,
      passPort: json['PassPort'] as String?,
      website: json['Website'] as String?,
      currency: json['Currency'] as String?,
      bankAccount: json['BankAccount'] as String?,
    );

Map<String, dynamic> _$RegisterParamsToJson(RegisterParams instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'Email': instance.email,
      'Phone': instance.phone,
      'IdType': instance.idType,
      'IdNumber': instance.idNumber,
      'FullName': instance.fullName,
      'FullNameAr': instance.fullNameAr,
      'Address': instance.address,
      'CreatedBy': instance.createdBy,
      'File': _$JsonConverterToJson<String, File>(
          instance.passportFile, const FileConverter().toJson),
      'GoogleRecaptchaResponse': instance.googleRecaptchaResponse,
      'FirebaseDeviceId': instance.firebaseDeviceId,
      'Signture': instance.signture,
      'AccountCategory': instance.accountCategory,
      'AccountType': instance.accountType,
      'Gender': instance.gender,
      'BirthDate': instance.birthDate,
      'PassPort': instance.passPort,
      'Website': instance.website,
      'Currency': instance.currency,
      'BankAccount': instance.bankAccount,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
