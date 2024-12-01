import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/texts/black_texts.dart';
import '../../../main_index.dart';

class ProfileItem extends BaseStatelessWidget {
  final String icon;
  final String title;
  final Color iconColor;
  final Function()? onTap;
  final String? routeName;
  final double iconSize;

  ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.routeName,
    this.iconSize = 20,
    this.iconColor = AppColors.primaryLightText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            pushNamed(routeName!);
          },
      child: Container(
        padding: 10.paddingAll,
        decoration: Decorations.shapeDecorationShadow(),
        child: ListTile(
          visualDensity: const VisualDensity(horizontal: -2, vertical: -4),
          contentPadding: 0.paddingVert + 1.paddingHoriz,
          leading: AppIcon(
            icon: icon,
            size: iconSize,
            color: iconColor,
          ),
          minLeadingWidth: 20,
          title: Text(
            title,
            style: primaryRegularStyle.copyWith(
                fontSize: 16, color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
