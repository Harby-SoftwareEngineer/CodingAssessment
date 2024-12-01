
import 'package:app/core/resources/data_state.dart';
import 'package:app/src/cart/data/models/cart_query_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';

import '../../../main_index.dart';
import '../../domain/entities/cart_query.dart';
import '../bloc/cart_bloc.dart';
import 'cart_screen.dart';

class CartPage extends BaseBlocWidget<
    DataSuccess<List<CartQuery>>, CartCubit> {
  CartPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProducts();
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<CartQuery>> state) {
    return ProductsScreen(data: state.data!);
  }

  @override
  String? title(BuildContext context) {
    return 'My Shopping Cart';
  }
}
