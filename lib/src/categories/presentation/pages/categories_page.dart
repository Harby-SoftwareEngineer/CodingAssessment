
import 'package:flutter/material.dart';

import '../../../../core/components/base_widget_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/category.dart';
import '../bloc/news_bloc.dart';
import 'categories_screen.dart';

class CategoriesPage extends BaseBlocWidget<
    DataSuccess<List<Category>>, CategoriesCubit> {
  CategoriesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCategories();
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<Category>> state) {
    return CategoriesScreen(data: state.data!);
  }

  @override
  String? title(BuildContext context) {
    return strings.categories;
  }
}
