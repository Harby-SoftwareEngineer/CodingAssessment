import 'dart:math';

import 'package:flutter/material.dart';

///  Created by harbey on 9/4/2023.
class FlipAssetImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final bool isRtl;
  final double? radius;

  const FlipAssetImage({Key? key, required this.image, this.height, this.width, this.isRtl  = true, this.radius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      // if languageCode is RTL flip image
      transform: Matrix4.rotationY(Localizations.localeOf(context).languageCode == (isRtl ? 'ar' : 'en') ? pi : 0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius??0.0)),
          child: Image.asset(image,fit: BoxFit.cover, height: height, width: width)),
    );
  }
}
