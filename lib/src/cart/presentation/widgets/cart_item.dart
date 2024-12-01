import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/core/widgets/texts/primary_texts.dart';
import 'package:app/core/widgets/texts/white_texts.dart';

import '../../../main_index.dart';
import '../../domain/entities/cart_query.dart';

class CartItem extends BaseStatelessWidget {
  final CartQuery cartQuery;
  final Function(CartQuery) onRemove;
  final Function(CartQuery) onChangeQuantity;

  CartItem(
      {Key? key,
      required this.cartQuery,
      required this.onRemove,
      required this.onChangeQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.paddingAll,
      margin: basePadding,
      decoration: Decorations.shapeDecorationShadow(
        color: Color(0xFF242C3B),
      ),
      child: Row(
        children: [
          image(),
          10.pw,
          details(),
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
          children: [
            title(),
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
    return WhiteBoldText(label: cartQuery.title ?? '', fontSize: 15);
  }

  Widget removeButton() {
    return IconButton(
      icon: Icon(Icons.delete, color: errorColor),
      onPressed: () => onRemove(cartQuery),
    );
  }

  Widget price() {
    return PrimaryRegularText(
        label: '\$${cartQuery.price.toString()}', fontSize: 14);
  }

  StreamStateInitial<int> get quantityStream =>
      StreamStateInitial<int>();

  Widget counters() {
    return Row(
      children: [
        AppIconButton(
          icon: AppIcons.add,
          onPressed: () {
            onChangeQuantity(cartQuery);
          },
        ),
        StreamBuilder<int>(
            stream: quantityStream.stream,
            initialData: cartQuery.id,
            builder: (context, snapshot) {
              return PrimaryRegularText(
                  label: snapshot.data.toString(), fontSize: 14);
            }),
        AppIconButton(
          icon: AppIcons.minus,
          onPressed: () => onChangeQuantity(cartQuery),
        ),
      ],
    );
  }
}
