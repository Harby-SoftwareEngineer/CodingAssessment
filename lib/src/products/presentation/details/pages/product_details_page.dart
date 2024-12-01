
import 'package:app/src/products/presentation/details/bloc/product_details_bloc.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../cart/data/models/cart_query_dto.dart';
import '../../../../main_index.dart';

import '../../../domain/entities/product.dart';
import 'product_details_screen.dart';

class ProductDetailsPage extends BaseBlocWidget<UnInitState, ProductDetailsCubit> {
  ProductDetailsPage({Key? key}) : super(key: key);


  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    Product product = getArguments(context);
    return ProductDetailsScreen(data: product,
    onAddToCart: (CartQueryDto query) {
      bloc.addToCart(query);
    },
    );
  }

  @override
  String? title(BuildContext context) {
    Product product = getArguments(context);
    return product.title;
  }
}
