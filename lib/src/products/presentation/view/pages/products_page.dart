
import 'package:app/src/categories/domain/entities/category.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';

import '../../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import 'products_screen.dart';

class ProductsPage extends BaseBlocWidget<
    DataSuccess<List<Product>>, ProductsCubit> {
  ProductsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    Category? category = getArguments(context);
    bloc.fetchProducts(category?.id);
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<Product>> state) {
    return ProductsScreen(data: state.data ?? []);
  }

  @override
  String? title(BuildContext context) {
    return strings.products;
  }
}
