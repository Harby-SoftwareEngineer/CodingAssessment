// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiresIn: json['expiresIn'] as String?,
      localId: json['localId'] as String?,
      registered: json['registered'] as bool?,
    );

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'localId': instance.localId,
      'registered': instance.registered,
    };
