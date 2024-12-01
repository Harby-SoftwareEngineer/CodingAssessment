import 'package:app/core/components/base_stateless_widget.dart';
import 'package:app/core/widgets/texts/primary_texts.dart';

import '../../../src/main_index.dart';

class RowIconText extends BaseStatelessWidget {
  String icon;
  final String value;
  final TextStyle? valueStyle;
  final Color? labelColor;
  final Color? containerColor;
  final double? iconSize;
  final EdgeInsetsGeometry padding;
   RowIconText({super.key,required this.icon,this.containerColor,required this.value, this.valueStyle,this.labelColor,this.iconSize, this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 2)});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         AppIcon(icon: icon,size: iconSize,),
        7.pw,
        Container(
          decoration: Decorations.kDecorationBorderRadius(
              radius: 5,
              color: containerColor,
              borderColor: containerColor),
          padding: padding,
          child: Center(
            child: PrimaryRegularText(
              labelColor: labelColor,
              label: value,
              fontSize: 12,
              labelStyle: valueStyle,
            ),
          ),
        )
      ],
    );
  }
}
