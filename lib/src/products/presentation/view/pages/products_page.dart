
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';

import '../../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import 'products_screen.dart';

class ProductsPage extends BaseBlocWidget<
    UnInitState, ProductsCubit> {
  ProductsPage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchProducts();
  // }

  // @override
  // Widget build(
  //     BuildContext context) {
  //   return mainFrame(body: Stack(
  //     children: [
  //       AppIcon(icon: AppIcons.background_home)
  //     ],
  //   ));
  // }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return ProductsScreen(data:[]);
  }

  @override
  String? title(BuildContext context) {
    return strings.notifications;
  }
}
