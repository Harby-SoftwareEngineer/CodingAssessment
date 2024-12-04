import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/texts/black_texts.dart';
import '../../../main_index.dart';

class ProfileItem extends BaseStatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
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
    this.iconColor,
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
        decoration: Decorations.shapeDecorationShadow(color: primaryColorDark),
        child: ListTile(
          visualDensity: const VisualDensity(horizontal: -2, vertical: -4),
          contentPadding: 0.paddingVert + 1.paddingHoriz,
          leading: Icon(
            icon,
            size: iconSize,
            color: iconColor ?? cardColor,
          ),
          minLeadingWidth: 20,
          title: Text(
            title,
            style: whiteRegularStyle.copyWith(
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
