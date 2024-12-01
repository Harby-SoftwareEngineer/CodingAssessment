import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AppIcon({Key? key, required this.icon, this.width, this.height, this.size, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: icon.split('.').last == 'svg'
          ?
      SvgPicture.asset(
        icon,
        height: height ?? size,
        width: width ?? size,
        color: color,
      ) : Image.asset(
        icon,
        height: height ?? size,
        width: width ?? size,
        color: color,
      ),
    );
  }
}
