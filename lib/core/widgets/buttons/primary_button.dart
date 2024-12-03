
import 'package:app/core/widgets/texts/white_texts.dart';

import '../../../src/main_index.dart';
import '../container/LinearGradientContainer.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final double? fontSize;
  final bool isFixedSize;
  const PrimaryButton({Key? key, this.title, this.onPressed, this.height = 55, this.backgroundColor, this.borderRadius, this.elevation, this.radius, this.margin, this.style, this.fontSize, this.width, this.padding, this.isFixedSize = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          // stops: [5.0, 00],
          colors: [
            Color(0xFF4FE3F4),
            Color(0xFF212EDE),
          ],
        ),
      ),
      child: Container(
        margin: 2.paddingAll,
        padding: 12.paddingAll + 20.paddingHoriz,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            // stops: [5.0, 00],
            colors: [
              Color(0xFF36BBE9),
              Color(0xFF4361E1),
            ],
          ),
        ),

        child: InkWell(
          onTap: onPressed,
          child: FittedBox(child: WhiteMediumText(label:
              title!,
          fontSize: fontSize ?? 18,
          )),
        ),
      ),
    );
  }
}
