
import 'package:flutter/material.dart';

import '../../../../core/components/base_stateless_widget.dart';
import '../../domain/entities/category.dart';
import '../widgets/news_item.dart';

class CategoriesScreen extends BaseStatelessWidget {
  final List<Category> data;

  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          item: data[index],
        );
      },
    );
  }
}
