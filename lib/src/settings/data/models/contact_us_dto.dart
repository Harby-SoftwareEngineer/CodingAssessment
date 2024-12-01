import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/home_data_dto.dart';

part 'contact_us_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ContactUsDto {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'subtitle')
  String? subtitle;
  @JsonKey(name: 'contactForm')
  MarkupDto? contactForm;
  @JsonKey(name: 'contactAddress')
  String? contactAddress;
  @JsonKey(name: 'contactMap')
  String? contactMap;
  @JsonKey(name: 'contactEmail')
  String? contactEmail;
  @JsonKey(name: 'contactPhone')
  String? contactPhone;
  @JsonKey(name: 'contactWhatsApp')
  String? contactWhatsApp;

  ContactUsDto({this.title, this.subtitle, this.contactForm, this.contactAddress, this.contactMap, this.contactEmail, this.contactPhone, this.contactWhatsApp});

   factory ContactUsDto.fromJson(Map<String, dynamic> json) => _$ContactUsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ContactUsDtoToJson(this);
}

