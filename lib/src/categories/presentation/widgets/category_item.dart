import 'package:app/core/exceptions/extensions.dart';
import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/core/widgets/texts/white_texts.dart';

import '../../../main_index.dart';
import '../../domain/entities/category.dart';

class CategoryItem extends BaseStatelessWidget {
  final Category item;

  CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNamed(Routes.productsPage, arguments: item),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const AppIcon(
            icon: AppIcons.inactive_category,
            size: 100,
          ),
          item.isAll
              ? WhiteMediumText(label: item.name ?? '')
              : ImageNetworkCircle(
                  image: item.image,
                  width: 65,
                  height: 65,
                ),
        ],
      ).paddingHoriz(10),
    );
  }
}
