
class Splash{
  final int id;
  final String image;
  final String description;

  Splash({
    required this.id,
    required this.image,
    required this.description,
  });

  factory Splash.fromJson(Map<String, dynamic> json) {
    return Splash(
      id: json['id'],
      image: json['image'],
      description: json['description'],
    );
  }
}