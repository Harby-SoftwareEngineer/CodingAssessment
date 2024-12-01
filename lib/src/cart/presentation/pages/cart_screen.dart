import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:app/core/widgets/texts/white_texts.dart';

import '../../../main_index.dart';

import '../../data/models/cart_query_dto.dart';
import '../../domain/entities/cart_query.dart';
import '../widgets/cart_item.dart';

class ProductsScreen extends BaseStatelessWidget {
  final List<CartQuery> data;
  final Function(CartQueryDto) onRemove;
  final Function(CartQueryDto) onChangeQuantity;

  ProductsScreen({Key? key, required this.data, required this.onRemove, required this.onChangeQuantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listProducts(),
        orderInfo(),
      ],
    );
  }

  Widget listProducts() {
    return Expanded(
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CartItem(
            cartQuery: data[index],
            onRemove: onRemove,
            onChangeQuantity: onChangeQuantity,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: cardColor.withOpacity(0.5), thickness: 0.5,);
        }
      ),
    );
  }

  Widget orderInfo(){
    return Container(
      padding: 16.paddingAll + 60.paddingBottom,
      decoration: Decorations.shapeDecorationShadow(
        color: Color(0xFF242C3B),
        colorShadow: Color(0xFF242C3B).withOpacity(0.5),
      ),
      child: Column(
        children: [
          HintRegularText(label: 'Your bag qualifies for free shipping', fontSize: 15),
          10.ph,
          Column(
            children: [
              label(
                label: 'Subtotal',
                value: '\$${CartQuery.subTotal(data)}',
              ),
              label(
                label: 'Delivery Fee',
                value: '\$0',
              ),
              label(
                label: 'Discount',
                value: '%10',
              ),
              label(
                label: 'Total',
                value: '\$${CartQuery.total(data,0,0)}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget label({
    required String label,
    required String value,
    TextStyle? valueStyle ,
}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WhiteMediumText(label: '$label:'),
        HintRegularText(label: value, labelStyle: valueStyle),
      ],
    ).paddingVert(5);
  }
}
