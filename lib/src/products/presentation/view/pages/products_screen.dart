import '../../../../main_index.dart';
import '../../../domain/entities/product.dart';
import '../widgets/products_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsScreen extends BaseStatelessWidget {
  final List<Product> data;

  ProductsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 14.paddingHoriz,
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        // mainAxisSpacing: 4,
        crossAxisSpacing: 16,
        children: data.map((item) {
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount:  data.indexOf(item) == 0 ? 2.9 : 2.5,
            child: ProductItem(
              isFirst: data.indexOf(item) == 0 ? true : false,
              item: item,
            ),
          );
        }).toList(),
      ),
    );
  }
}
