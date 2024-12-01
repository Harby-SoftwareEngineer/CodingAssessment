
import '../../../main_index.dart';
import '../../data/models/cart_query_dto.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/entities/cart_query.dart';
import '../widgets/cart_item.dart';

class ProductsScreen extends BaseStatelessWidget {
  final List<CartQuery> data;

  ProductsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CartItem(
          cartQuery: data[index],
          onRemove: (cartQuery) {},
          onChangeQuantity: (cartQuery) {},
        );
      },
    );
  }
}
