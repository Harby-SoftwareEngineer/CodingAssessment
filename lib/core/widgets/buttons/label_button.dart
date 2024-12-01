import '../../../src/main_index.dart';

class LabelButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? style;

  const LabelButton({
    Key? key,
    required this.title,
    this.onTap,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: style ?? context.bodyMedium.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
