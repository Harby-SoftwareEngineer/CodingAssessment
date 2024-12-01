import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../../../../../core/widgets/container/LinearGradientContainer.dart';
import '../../../../../core/widgets/texts/primary_texts.dart';
import '../../../../../core/widgets/texts/white_texts.dart';
import '../../../../cart/data/models/cart_query_dto.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/product.dart';
import '../widgets/slider_widget.dart';

class ProductDetailsScreen extends BaseStatelessWidget {
  final Product data;
  final Function(CartQueryDto query) onAddToCart;

  ProductDetailsScreen({Key? key, required this.data, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSliderWidget(
          images: data.images ?? [],
        ),
        Spacer(),
        details(context),
      ],
    );
  }

  Widget details(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color(0xFF353F54),
            Color(0xFF222834),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowButtons(context),
              10.ph,
              title(context),
              10.ph,
              description(context),
            ],
          ).paddingAll(20),
          checkOut(context),
        ],
      ),
    );
  }

  Widget rowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NeumorphicButton(
            child: HintRegularText(
              label: "Specifications",
              fontSize: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            style: NeumorphicStyle(
              color: const Color(0xFF323B4F),
              shadowLightColor: const Color(0xFF323B4F),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              shape: NeumorphicShape.convex,
              depth: 10,
            ),
            onPressed: () {},
          ),
        ),
        20.pw,
        Expanded(
          child: NeumorphicButton(
            child: HintRegularText(
              label: "Specifications",
              fontSize: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            style: NeumorphicStyle(
              color: const Color(0xFF28303F),
              shadowLightColor: const Color(0xFF28303F),
              shadowLightColorEmboss: const Color(0xFF28303F),
              shadowDarkColorEmboss: const Color(0xFF28303F),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              depth: -5200,
            ),
            onPressed: () {},
          ),
        ),
      ],
    ).paddingAll(10);
  }

  Widget title(BuildContext context) {
    return WhiteBoldText(
      label: data.title ?? "",
      fontSize: 17,
    );
  }

  Widget description(BuildContext context) {
    return HintRegularText(
      label: data.description ?? "",
      fontSize: 15,
    );
  }


  Widget checkOut(BuildContext context) {
    return LinearGradientContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryRegularText(label: data.priceString, fontSize: 24),
          PrimaryButton(
            width: 100,
            title: "Add to Cart",
            fontSize: 15,
            onPressed: () {
              onAddToCart(CartQueryDto(
                id: data.id,
                title: data.title,
                price: data.price,
                quantity: 1,
                image: data.images?.first ?? "",
              ));
            }
          ),
        ],
      ).paddingOnly(top: 20, bottom: 20, start: 30, end: 30),
    );
  }
}
