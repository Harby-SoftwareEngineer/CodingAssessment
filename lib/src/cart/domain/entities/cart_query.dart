
import '../../data/models/cart_query_dto.dart';

class CartQuery {
  int? id;
  String? title;
  int? price;
  String? image;

  CartQuery({this.id, this.title, this.price, this.image});

  factory CartQuery.fromJson(CartQueryDto dto) => CartQuery(
        id: dto.id,
        title: dto.title,
        price: dto.price,
        image: dto.image,
      );


  static List<CartQuery> fromDtoList(List<CartQueryDto> dtoList) {
    return dtoList.map((e) => CartQuery.fromJson(e)).toList();
  }
}
