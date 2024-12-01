import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constants.dart';

part 'home_data_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class HomeDataDto {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'facebook')
  String? facebook;
  @JsonKey(name: 'twitterX')
  String? twitterX;
  @JsonKey(name: 'instagram')
  String? instagram;
  @JsonKey(name: 'slides')
  List<SlideDto>? slides;
  @JsonKey(name: 'aboutTitle')
  String? aboutTitle;
  @JsonKey(name: 'aboutDescription')
  MarkupDto? aboutDescription;
  @JsonKey(name: 'aboutImage')
  List<AboutImage>? aboutImage;
  @JsonKey(name: 'objectiveTitle')
  String? objectiveTitle;
  @JsonKey(name: 'objectiveDescription')
  ObjectiveDescription? objectiveDescription;
  @JsonKey(name: 'objectiveImage')
  List<ObjectiveImage>? objectiveImage;
  @JsonKey(name: 'trophiesTitle')
  String? trophiesTitle;
  @JsonKey(name: 'trophiesDescription')
  TrophiesDescription? trophiesDescription;
  @JsonKey(name: 'trophiesImage')
  List<TrophiesImage>? trophiesImage;

  HomeDataDto({this.email, this.address, this.phone, this.facebook, this.twitterX, this.instagram, this.slides, this.aboutTitle, this.aboutDescription, this.aboutImage, this.objectiveTitle, this.objectiveDescription, this.objectiveImage, this.trophiesTitle, this.trophiesDescription, this.trophiesImage});

   factory HomeDataDto.fromJson(Map<String, dynamic> json) => _$HomeDataDtoFromJson(json);

   Map<String, dynamic> toJson() => _$HomeDataDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class SlideDto {
  @JsonKey(name: 'contentType')
  String? contentType;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'properties')
  PropertiesSlideDto? properties;

  SlideDto({this.contentType, this.id, this.properties});

   factory SlideDto.fromJson(Map<String, dynamic> json) => _$SlideDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SlideDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class PropertiesSlideDto {
  @JsonKey(name: 'sliderTitle')
  String? sliderTitle;
  @JsonKey(name: 'sliderSubTitle')
  String? sliderSubTitle;
  @JsonKey(name: 'sliderSubTitle2')
  String? sliderSubTitle2;
  @JsonKey(name: 'sliderImage')
  List<SliderImageDto>? sliderImage;

  PropertiesSlideDto({this.sliderTitle, this.sliderSubTitle, this.sliderSubTitle2, this.sliderImage});

   factory PropertiesSlideDto.fromJson(Map<String, dynamic> json) => _$PropertiesSlideDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PropertiesSlideDtoToJson(this);

   String get imageUrl => '$kBaseUrl${sliderImage?.first.url}';

   bool get isVideo => sliderImage?.first.mediaType == 'umbracoMediaVideo';
}

@JsonSerializable(ignoreUnannotated: false)
class SliderImageDto {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'mediaType')
  String? mediaType;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'extension')
  String? extension;
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'bytes')
  int? bytes;
  @JsonKey(name: 'properties')
  PropertiesSlideDto? properties;

  SliderImageDto({ this.id, this.name, this.mediaType, this.url, this.extension, this.width, this.height, this.bytes, this.properties});

   factory SliderImageDto.fromJson(Map<String, dynamic> json) => _$SliderImageDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SliderImageDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class MarkupDto {
  @JsonKey(name: 'markup')
  String? markup;

  MarkupDto({this.markup});

   factory MarkupDto.fromJson(Map<String, dynamic> json) => _$MarkupDtoFromJson(json);

   Map<String, dynamic> toJson() => _$MarkupDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class AboutImage {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'mediaType')
  String? mediaType;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'extension')
  String? extension;
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'bytes')
  int? bytes;
  @JsonKey(name: 'properties')
  PropertiesSlideDto? properties;

  AboutImage({ this.id, this.name, this.mediaType, this.url, this.extension, this.width, this.height, this.bytes, this.properties});

   factory AboutImage.fromJson(Map<String, dynamic> json) => _$AboutImageFromJson(json);

   Map<String, dynamic> toJson() => _$AboutImageToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ObjectiveDescription {
  @JsonKey(name: 'markup')
  String? markup;

  ObjectiveDescription({this.markup});

   factory ObjectiveDescription.fromJson(Map<String, dynamic> json) => _$ObjectiveDescriptionFromJson(json);

   Map<String, dynamic> toJson() => _$ObjectiveDescriptionToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ObjectiveImage {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'mediaType')
  String? mediaType;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'extension')
  String? extension;
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'bytes')
  int? bytes;
  @JsonKey(name: 'properties')
  PropertiesSlideDto? properties;

  ObjectiveImage({ this.id, this.name, this.mediaType, this.url, this.extension, this.width, this.height, this.bytes, this.properties});

   factory ObjectiveImage.fromJson(Map<String, dynamic> json) => _$ObjectiveImageFromJson(json);

   Map<String, dynamic> toJson() => _$ObjectiveImageToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class TrophiesDescription {
  @JsonKey(name: 'markup')
  String? markup;

  TrophiesDescription({this.markup});

   factory TrophiesDescription.fromJson(Map<String, dynamic> json) => _$TrophiesDescriptionFromJson(json);

   Map<String, dynamic> toJson() => _$TrophiesDescriptionToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class TrophiesImage {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'mediaType')
  String? mediaType;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'extension')
  String? extension;
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'bytes')
  int? bytes;
  @JsonKey(name: 'properties')
  PropertiesSlideDto? properties;

  TrophiesImage({this.id, this.name, this.mediaType, this.url, this.extension, this.width, this.height, this.bytes, this.properties});

   factory TrophiesImage.fromJson(Map<String, dynamic> json) => _$TrophiesImageFromJson(json);

   Map<String, dynamic> toJson() => _$TrophiesImageToJson(this);
}