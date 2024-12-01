
import '../../data/models/cart_query_dto.dart';

class CartQuery {
  int? id;
  String? title;
  int? price;
  int? quantity;
  String? image;

  CartQuery({this.id, this.title, this.price, this.quantity, this.image});

  factory CartQuery.fromJson(CartQueryDto dto) => CartQuery(
        id: dto.id,
        title: dto.title,
        price: dto.price,
        quantity: dto.quantity,
        image: dto.image,
      );

  static CartQueryDto toDto(CartQuery cartQuery) => CartQueryDto(
        id: cartQuery.id,
        title: cartQuery.title,
        price: cartQuery.price,
        quantity: cartQuery.quantity,
        image: cartQuery.image,
      );


  static List<CartQuery> fromDtoList(List<CartQueryDto> dtoList) {
    return dtoList.map((e) => CartQuery.fromJson(e)).toList();
  }

  static subTotal (List<CartQuery> cartQuery){
    return cartQuery.fold(0, (previousValue, element) => previousValue + (element.price! * (element.quantity ?? 1)));
  }

  static total (List<CartQuery> cartQuery, double deliveryFee, double discount){
    return subTotal(cartQuery) + deliveryFee - (subTotal(cartQuery) / discount);
  }
}
