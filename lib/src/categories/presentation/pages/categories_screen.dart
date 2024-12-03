
import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends BaseStatelessWidget {
  final List<Category> data;

  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      padding: 0.paddingAll,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisExtent: 120,
      ),
      itemBuilder: (context, index) {
        return CategoryItem(
          item: data[index],
        );
      },
    );
  }
}
