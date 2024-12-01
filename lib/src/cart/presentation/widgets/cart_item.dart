import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/core/widgets/texts/primary_texts.dart';
import 'package:app/core/widgets/texts/white_texts.dart';

import '../../../main_index.dart';
import '../../data/models/cart_query_dto.dart';
import '../../domain/entities/cart_query.dart';

class CartItem extends BaseStatelessWidget {
  final CartQuery cartQuery;
  final Function(CartQueryDto) onRemove;
  final Function(CartQueryDto) onChangeQuantity;

  CartItem(
      {Key? key,
      required this.cartQuery,
      required this.onRemove,
      required this.onChangeQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.paddingAll,
      decoration: Decorations.radiusDecoration(
        color: Color(0xFF242C3B),
        radius: 0,
      ),
      child: Row(
        children: [
          image(),
          10.pw,
          Expanded(child: details()),
        ],
      ),
    );
  }

  Widget image() {
    return ImageNetwork(
      image: cartQuery.image,
      width: 100,
      height: 90,
    );
  }

  Widget details() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: title()),
            removeButton(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            price(),
            counters(),
          ],
        ),
      ],
    );
  }

  Widget title() {
    return WhiteBoldText(label: cartQuery.title ?? '', fontSize: 15, maxLines: 2);
  }

  Widget removeButton() {
    return IconButton(
      icon: Icon(Icons.delete, color: errorColor),
      onPressed: () => onRemove(CartQuery.toDto(cartQuery)),
    );
  }

  Widget price() {
    return PrimaryRegularText(
        label: '\$${cartQuery.price.toString()}', fontSize: 14);
  }


  int quantity = 1;

  Widget counters() {
    quantity = cartQuery.quantity ?? 1;
    return Row(
      children: [
        AppIconButton(
          icon: AppIcons.add,
          padding: 10.paddingAll,
          onPressed: () {
            quantity++;
            cartQuery.quantity = quantity;
            onChangeQuantity(CartQuery.toDto(cartQuery));
          },
        ),
        PrimaryRegularText(
            label: cartQuery.quantity.toString(), fontSize: 14),
        AppIconButton(
          icon: AppIcons.minus,
          padding: 10.paddingAll,
          onPressed: () {
            quantity--;
            cartQuery.quantity = quantity;
            onChangeQuantity(CartQuery.toDto(cartQuery));
          },
        ),
      ],
    );
  }
}
