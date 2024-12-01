import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/components/base_stateless_widget.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/widgets/buttons/app_icon.dart';
import '../../../../core/widgets/texts/black_texts.dart';
import '../../domain/entities/category.dart';

class CategoryItem extends BaseStatelessWidget {
  final Category item;

  CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        padding: 10.paddingAll,
        margin: basePaddingItem,
        decoration: Decorations.shapeDecorationShadow(),
        child: Column(
          children: [
            header(),
            10.ph,
            body(),
          ],
        ),
      ),
    );
  }

  Row header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ImageNetwork(
        //   image: item.firstImage,
        //   width: 100,
        //   height: 100,
        // ),
        // 10.pw,
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       BlackBoldText(
        //         label: item.newsTitle ?? '',
        //         fontSize: 14,
        //       ),
        //       const Divider(height: 20, endIndent: 40, thickness: 0.5),
        //       IconText(
        //           text: item.dateFormatted,
        //           isIconData: true,
        //           iconSize: 18,
        //           crossAxisAlignment: CrossAxisAlignment.end,
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           textStyle: hintBoldStyle.copyWith(fontSize: 14),
        //           iconData: Icons.calendar_today),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Html body() {
    return  Html(
      data: '',
    );
  }

  IconButton moreButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.more_horiz,
      ),
      padding: EdgeInsets.zero,
      onPressed: () => showActionsBottomSheet(context),
    );
  }

  showActionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: 15.paddingAll,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const AppIcon(icon: AppIcons.details),
                  title: BlackRegularText(label: strings.details),
                  onTap: () {},
                ),
                ListTile(
                  leading: AppIcon(icon: AppIcons.delete, color: errorColor),
                  title: BlackRegularText(label: 'حذف', labelColor: errorColor),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
