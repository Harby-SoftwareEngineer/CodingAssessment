import '../../data/models/category_dto.dart';

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;
  bool isAll;

  Category(
      {this.id,
      this.name,
      this.image,
      this.creationAt,
      this.updatedAt,
      this.isAll = false});

  factory Category.fromDto(CategoryDto json) => Category(
        id: json.id,
        name: json.name,
        image: json.image,
        creationAt: json.creationAt,
        updatedAt: json.updatedAt,
        isAll: false,
      );

  static List<Category> fromDtoList(List<CategoryDto> dto) {
    return dto.map((e) => Category.fromDto(e)).toList();
  }
}
