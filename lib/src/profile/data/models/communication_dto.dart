import 'package:json_annotation/json_annotation.dart'; 

part 'communication_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CommunicationDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'Linkedin')
  String? Linkedin;
  @JsonKey(name: 'Facebook')
  String? Facebook;
  @JsonKey(name: 'Telegram')
  String? Telegram;
  @JsonKey(name: 'Whatsapp')
  String? Whatsapp;
  @JsonKey(name: 'Google')
  String? Google;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  CommunicationDto({this.id, this.Linkedin, this.Facebook, this.Telegram, this.Whatsapp, this.Google, this.updatedAt});

   factory CommunicationDto.fromJson(Map<String, dynamic> json) => _$CommunicationDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CommunicationDtoToJson(this);
}

