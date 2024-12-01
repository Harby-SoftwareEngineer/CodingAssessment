import 'package:json_annotation/json_annotation.dart'; 

part 'profile_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {
  @JsonKey(name: 'idToken')
  String? idToken;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;
  @JsonKey(name: 'expiresIn')
  String? expiresIn;
  @JsonKey(name: 'localId')
  String? localId;
  @JsonKey(name: 'registered')
  bool? registered;

  ProfileDto({
    this.idToken,
    this.refreshToken,
    this.expiresIn,
    this.localId,
    this.registered,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

