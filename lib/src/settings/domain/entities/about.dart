import '../../data/models/about_dto.dart';

class About {
  int? id;
  String? name;
  String? description;

  About({this.id, this.name, this.description});

  factory About.fromDto(AboutDto json) => About(
        id: json.id,
        name: json.name,
        description: json.description,
      );
}


enum AboutType {
  aboutUs,
  terms,
}