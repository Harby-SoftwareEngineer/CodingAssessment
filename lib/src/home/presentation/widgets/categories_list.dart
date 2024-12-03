
import '../../../../core/widgets/images/image_network.dart';
import '../../../../core/widgets/texts/white_texts.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../main_index.dart';

class CategoriesList extends BaseStatelessWidget {
  final List<Category> categories;
  final Function(Category) onTap;
  CategoriesList({super.key, required this.categories, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Category selectedCategory = Category(id: 0, name: strings.all, isAll: true);
    categories.insert(0,selectedCategory);
    return SizedBox(
      height: 360,
      child: StatefulBuilder(
        builder: (context, setState) {
          return ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: 240.paddingTop,
            itemBuilder: (context, index) {
              return _CategoryItem(
                item: categories[index],
                isSelected: selectedCategory == categories[index],
                onTap: (id) {
                  selectedCategory = categories[index];
                  onTap(categories[index]);
                  setState(() {});
                },
              ).paddingTop(index.isEven ? 20 : 0);
            },
          );
        }
      ),
    );
  }
}



class _CategoryItem extends BaseStatelessWidget {
  final Category item;
  final bool isSelected;
  final Function(Category) onTap;

  _CategoryItem({required this.item, this.isSelected = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppIcon(
            icon: isSelected ? AppIcons.active_category : AppIcons.inactive_category,
            height: 55,
            width: 55,
          ),
          item.isAll
              ? WhiteMediumText(label: item.name ?? '')
              : ImageNetworkCircle(
            image: item.image,
            width: 35,
            height: 35,
          ),
        ],
      ).paddingHoriz(10),
    );
  }
}