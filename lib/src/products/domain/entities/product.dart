
import '../../../categories/domain/entities/category.dart';
import '../../data/models/product_dto.dart';

class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Product({this.id, this.title, this.price, this.description, this.images, this.creationAt, this.updatedAt, this.category});

   factory Product.fromDto(ProductDto json) => Product(
    id: json.id,
    title: json.title,
    price: json.price,
    description: json.description,
    images: json.images,
    creationAt: json.creationAt,
    updatedAt: json.updatedAt,
    category: json.category != null ? Category.fromDto(json.category!) : null,
  );

  static List<Product> fromDtoList( List<ProductDto> dto) {
    return dto.map((e) => Product.fromDto(e)).toList();
  }

  String get priceString => '\$$price';
}

