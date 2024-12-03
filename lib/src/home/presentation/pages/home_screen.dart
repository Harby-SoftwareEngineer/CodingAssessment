
import 'package:app/core/commen/common_state.dart';
import 'package:app/core/exceptions/extensions.dart';
import 'package:app/src/products/domain/entities/product.dart';
import 'package:app/src/products/presentation/view/pages/products_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../../categories/domain/entities/category.dart';
import '../widgets/categories_list.dart';
import '../widgets/offer_product.dart';

class HomeScreen extends BaseStatelessWidget {
  final List<Category> categories;
  final List<Product> products;

  HomeScreen({
    super.key,
    required this.products,
    required this.categories
  });

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<List<Product>> productsStream = StreamStateInitial<List<Product>> ();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              OfferProduct(),
              CategoriesList(categories: categories, onTap: (category) {
                final productsFiltered = category.isAll ? products :
                products.where((element) => element.category?.id == category.id).toList();
                productsStream.setData(productsFiltered);
              }),
            ],
          ),
          StreamBuilder<List<Product>>(
            initialData: products,
            stream: productsStream.stream,
            builder: (context, snapshot) {
              return ProductsScreen(data: snapshot.data ?? []);
            }
          ),
        ],
      ),
    );
  }
}
