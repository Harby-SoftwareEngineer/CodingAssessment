
import '../../../../core/utils/constants.dart';
import '../../data/models/home_data_dto.dart';

class HomeData {
  String? email;
  String? address;
  String? phone;
  String? facebook;
  String? twitterX;
  String? instagram;
  List<SlideDto>? slides;
  String? aboutTitle;
  MarkupDto? aboutDescription;
  List<AboutImage>? aboutImage;
  String? objectiveTitle;
  ObjectiveDescription? objectiveDescription;
  List<ObjectiveImage>? objectiveImage;
  String? trophiesTitle;
  TrophiesDescription? trophiesDescription;
  List<TrophiesImage>? trophiesImage;

  HomeData({this.email, this.address, this.phone, this.facebook, this.twitterX, this.instagram, this.slides, this.aboutTitle, this.aboutDescription, this.aboutImage, this.objectiveTitle, this.objectiveDescription, this.objectiveImage, this.trophiesTitle, this.trophiesDescription, this.trophiesImage});

   factory HomeData.fromJson(HomeDataDto json) => HomeData(
    email: json.email,
    address: json.address,
    phone: json.phone,
    facebook: json.facebook,
    twitterX: json.twitterX,
    instagram: json.instagram,
    slides: json.slides,
    aboutTitle: json.aboutTitle,
    aboutDescription: json.aboutDescription,
    aboutImage: json.aboutImage,
    objectiveTitle: json.objectiveTitle,
    objectiveDescription: json.objectiveDescription,
    objectiveImage: json.objectiveImage,
    trophiesTitle: json.trophiesTitle,
    trophiesDescription: json.trophiesDescription,
    trophiesImage: json.trophiesImage,
  );


  String get aboutImageUrl => '$kBaseUrl${aboutImage?.first.url ?? ''}';
  String get objectiveImageUrl => '$kBaseUrl${objectiveImage?.first.url ?? ''}';
  String get trophiesImageUrl => '$kBaseUrl${trophiesImage?.first.url ?? ''}';

}
