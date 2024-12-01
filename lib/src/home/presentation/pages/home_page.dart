import 'package:app/core/exceptions/extensions.dart';
import 'package:app/core/widgets/buttons/app_icon_button.dart';
import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:app/src/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/components/base_widget_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../categories/domain/entities/category.dart';
import '../../domain/entities/home_data.dart';
import '../bloc/home_bloc.dart';
import 'home_screen.dart';

class HomePage extends BaseBlocWidget<DoubleDataSuccess, HomeCubit> {
  HomePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: mainFrame(body: Column(
        children: [
          50.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlackBoldText(
                label: "Choose Your Bike",
                labelStyle: context.whiteBoldStyle,
              ),
              AppIconButton(
                icon: AppIcons.search_circle,
                onPressed: (){},
              ),
            ],
          ).paddingHoriz(20),
          Expanded(child: buildConsumer(context))
        ],
      )),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    List<Category> categories = state.data1;
    List<Product> products = state.data2;
    return HomeScreen(
      categories: categories,
      products: products,
    );
  }
}
