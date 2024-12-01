import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'register_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class RegisterParams {
  @JsonKey(name: 'Password')
  String? password;
  @JsonKey(name: 'password_confirmation')
  String? passwordConfirmation;
  @JsonKey(name: 'Email')
  String? email;
  @JsonKey(name: 'Phone')
  String? phone;
  @JsonKey(name: 'IdType')
  String? idType;
  @JsonKey(name: 'IdNumber')
  String? idNumber;
  @JsonKey(name: 'FullName')
  String? fullName;
  @JsonKey(name: 'FullNameAr')
  String? fullNameAr;
  @JsonKey(name: 'Address')
  String? address;
  @JsonKey(name: 'CreatedBy')
  String? createdBy;
  @JsonKey(name: 'File')
  @FileConverter()
  File? passportFile;
  @JsonKey(name: 'GoogleRecaptchaResponse')
  String? googleRecaptchaResponse;
  @JsonKey(name: 'FirebaseDeviceId')
  String? firebaseDeviceId;
  @JsonKey(name: 'Signture')
  String? signture;
  @JsonKey(name: 'AccountCategory')
  String? accountCategory;
  @JsonKey(name: 'AccountType')
  String? accountType;
  @JsonKey(name: 'Gender')
  String? gender;
  @JsonKey(name: 'BirthDate')
  String? birthDate;
  @JsonKey(name: 'PassPort')
  String? passPort;
  @JsonKey(name: 'Website')
  String? website;
  @JsonKey(name: 'Currency')
  String? currency;
  @JsonKey(name: 'BankAccount')
  String? bankAccount;

  RegisterParams({
    this.password,
    this.passwordConfirmation,
    this.email,
    this.phone,
    this.idType,
    this.idNumber,
    this.fullName,
    this.fullNameAr,
    this.address,
    this.createdBy,
    this.passportFile,
    this.googleRecaptchaResponse,
    this.firebaseDeviceId,
    this.signture,
    this.accountCategory,
    this.accountType,
    this.gender,
    this.birthDate,
    this.passPort,
    this.website,
    this.currency,
    this.bankAccount,
  });

  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

class FileConverter implements JsonConverter<File, String> {
  const FileConverter();

  @override
  File fromJson(String json) {
    return File(json);
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}

