import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:app/core/widgets/icons/icon_text.dart';
import 'package:app/core/widgets/images/image_network.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/texts/black_texts.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/product.dart';

class ProductItem extends BaseStatelessWidget {
  final Product item;
  final bool isFirst;

  ProductItem({super.key, required this.item, this.isFirst = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNamed(Routes.productDetailsPage, arguments: item);
      },
      child: Padding(
        padding: (isFirst ? 25 : 0).paddingTop,
        child: Padding(
          padding: 0.paddingHoriz,
          child: Stack(
            children: [
              AppIcon(icon: AppIcons.background_product,
              height: 301,
                width: 165,
              ),
              Padding(
                padding: (isFirst ? 26 : 20).paddingVert + 20.paddingHoriz,
                child: header(),
              ),
              favoriteButton(),
            ],
          ),
        ),
      ),
    );
  }

  Align favoriteButton() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: AppIcon(
        icon: AppIcons.favorite,
        padding: (isFirst ? 25 : 20).paddingVert + 10.paddingHoriz ,
      ),
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        15.ph,
        image(),
        body(),
      ],
    );
  }

  ImageNetwork image() {
    return ImageNetwork(
      image: item.images!.first,
      width: 110,
      height: 70,
      fit: BoxFit.fill,
    );
  }

  Expanded body() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
          Flexible(
            child: HintMediumText(
              label: item.category?.name ?? '',
              fontSize: 13,
              maxLines: 1,
            ),
          ),
          5.ph,
          BlackBoldText(
            label: item.title ?? '',
            maxLines: 2,
            labelStyle: whiteBoldStyle.copyWith(fontSize: 13, ),
          ),
          5.ph,
          HintMediumText(
            label: '\$${item.price}' ?? '',
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
