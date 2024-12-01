
import 'package:app/core/exceptions/extensions.dart';
import 'package:app/src/products/domain/entities/product.dart';
import 'package:app/src/products/presentation/view/pages/products_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../../categories/domain/entities/category.dart';
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OfferProduct(),
          ProductsScreen(data: products),
        ],
      ),
    );
  }
}
