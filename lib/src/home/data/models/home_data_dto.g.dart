// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataDto _$HomeDataDtoFromJson(Map<String, dynamic> json) => HomeDataDto(
      email: json['email'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      facebook: json['facebook'] as String?,
      twitterX: json['twitterX'] as String?,
      instagram: json['instagram'] as String?,
      slides: (json['slides'] as List<dynamic>?)
          ?.map((e) => SlideDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      aboutTitle: json['aboutTitle'] as String?,
      aboutDescription: json['aboutDescription'] == null
          ? null
          : MarkupDto.fromJson(
              json['aboutDescription'] as Map<String, dynamic>),
      aboutImage: (json['aboutImage'] as List<dynamic>?)
          ?.map((e) => AboutImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectiveTitle: json['objectiveTitle'] as String?,
      objectiveDescription: json['objectiveDescription'] == null
          ? null
          : ObjectiveDescription.fromJson(
              json['objectiveDescription'] as Map<String, dynamic>),
      objectiveImage: (json['objectiveImage'] as List<dynamic>?)
          ?.map((e) => ObjectiveImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      trophiesTitle: json['trophiesTitle'] as String?,
      trophiesDescription: json['trophiesDescription'] == null
          ? null
          : TrophiesDescription.fromJson(
              json['trophiesDescription'] as Map<String, dynamic>),
      trophiesImage: (json['trophiesImage'] as List<dynamic>?)
          ?.map((e) => TrophiesImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataDtoToJson(HomeDataDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'facebook': instance.facebook,
      'twitterX': instance.twitterX,
      'instagram': instance.instagram,
      'slides': instance.slides,
      'aboutTitle': instance.aboutTitle,
      'aboutDescription': instance.aboutDescription,
      'aboutImage': instance.aboutImage,
      'objectiveTitle': instance.objectiveTitle,
      'objectiveDescription': instance.objectiveDescription,
      'objectiveImage': instance.objectiveImage,
      'trophiesTitle': instance.trophiesTitle,
      'trophiesDescription': instance.trophiesDescription,
      'trophiesImage': instance.trophiesImage,
    };

SlideDto _$SlideDtoFromJson(Map<String, dynamic> json) => SlideDto(
      contentType: json['contentType'] as String?,
      id: json['id'] as String?,
      properties: json['properties'] == null
          ? null
          : PropertiesSlideDto.fromJson(
              json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SlideDtoToJson(SlideDto instance) => <String, dynamic>{
      'contentType': instance.contentType,
      'id': instance.id,
      'properties': instance.properties,
    };

PropertiesSlideDto _$PropertiesSlideDtoFromJson(Map<String, dynamic> json) =>
    PropertiesSlideDto(
      sliderTitle: json['sliderTitle'] as String?,
      sliderSubTitle: json['sliderSubTitle'] as String?,
      sliderSubTitle2: json['sliderSubTitle2'] as String?,
      sliderImage: (json['sliderImage'] as List<dynamic>?)
          ?.map((e) => SliderImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertiesSlideDtoToJson(PropertiesSlideDto instance) =>
    <String, dynamic>{
      'sliderTitle': instance.sliderTitle,
      'sliderSubTitle': instance.sliderSubTitle,
      'sliderSubTitle2': instance.sliderSubTitle2,
      'sliderImage': instance.sliderImage,
    };

SliderImageDto _$SliderImageDtoFromJson(Map<String, dynamic> json) =>
    SliderImageDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaType: json['mediaType'] as String?,
      url: json['url'] as String?,
      extension: json['extension'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      bytes: (json['bytes'] as num?)?.toInt(),
      properties: json['properties'] == null
          ? null
          : PropertiesSlideDto.fromJson(
              json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SliderImageDtoToJson(SliderImageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mediaType': instance.mediaType,
      'url': instance.url,
      'extension': instance.extension,
      'width': instance.width,
      'height': instance.height,
      'bytes': instance.bytes,
      'properties': instance.properties,
    };

MarkupDto _$MarkupDtoFromJson(Map<String, dynamic> json) => MarkupDto(
      markup: json['markup'] as String?,
    );

Map<String, dynamic> _$MarkupDtoToJson(MarkupDto instance) => <String, dynamic>{
      'markup': instance.markup,
    };

AboutImage _$AboutImageFromJson(Map<String, dynamic> json) => AboutImage(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaType: json['mediaType'] as String?,
      url: json['url'] as String?,
      extension: json['extension'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      bytes: (json['bytes'] as num?)?.toInt(),
      properties: json['properties'] == null
          ? null
          : PropertiesSlideDto.fromJson(
              json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AboutImageToJson(AboutImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mediaType': instance.mediaType,
      'url': instance.url,
      'extension': instance.extension,
      'width': instance.width,
      'height': instance.height,
      'bytes': instance.bytes,
      'properties': instance.properties,
    };

ObjectiveDescription _$ObjectiveDescriptionFromJson(
        Map<String, dynamic> json) =>
    ObjectiveDescription(
      markup: json['markup'] as String?,
    );

Map<String, dynamic> _$ObjectiveDescriptionToJson(
        ObjectiveDescription instance) =>
    <String, dynamic>{
      'markup': instance.markup,
    };

ObjectiveImage _$ObjectiveImageFromJson(Map<String, dynamic> json) =>
    ObjectiveImage(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaType: json['mediaType'] as String?,
      url: json['url'] as String?,
      extension: json['extension'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      bytes: (json['bytes'] as num?)?.toInt(),
      properties: json['properties'] == null
          ? null
          : PropertiesSlideDto.fromJson(
              json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObjectiveImageToJson(ObjectiveImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mediaType': instance.mediaType,
      'url': instance.url,
      'extension': instance.extension,
      'width': instance.width,
      'height': instance.height,
      'bytes': instance.bytes,
      'properties': instance.properties,
    };

TrophiesDescription _$TrophiesDescriptionFromJson(Map<String, dynamic> json) =>
    TrophiesDescription(
      markup: json['markup'] as String?,
    );

Map<String, dynamic> _$TrophiesDescriptionToJson(
        TrophiesDescription instance) =>
    <String, dynamic>{
      'markup': instance.markup,
    };

TrophiesImage _$TrophiesImageFromJson(Map<String, dynamic> json) =>
    TrophiesImage(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaType: json['mediaType'] as String?,
      url: json['url'] as String?,
      extension: json['extension'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      bytes: (json['bytes'] as num?)?.toInt(),
      properties: json['properties'] == null
          ? null
          : PropertiesSlideDto.fromJson(
              json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrophiesImageToJson(TrophiesImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mediaType': instance.mediaType,
      'url': instance.url,
      'extension': instance.extension,
      'width': instance.width,
      'height': instance.height,
      'bytes': instance.bytes,
      'properties': instance.properties,
    };
