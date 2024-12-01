import 'package:path/path.dart';

import '../../src/main_index.dart';

class Decorations {
  static BoxDecoration radiusDecoration({
    Color? color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
    );
  }

  static BoxDecoration borderDecoration({
    Color? color,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(
        color: borderColor ?? injector<ServicesLocator>().appContext.dividerColor,
        width: 1.0,
      ),
    );
  }

  static BoxDecoration kDecorationTopRadius({
    Color? color,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
      //  border: Border.all(color: borderColor ?? injector<ServicesLocator>().appContext.dividerColor),
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 12),
        topRight: Radius.circular(radius ?? 12),
      ),
    );
  }

  static BoxDecoration kDecorationLiftRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(radius ?? 15),
        bottomStart: Radius.circular(radius ?? 15),
      ),
    );
  }

  static Decoration get decorationTabs =>
      decorationTabsOnlyTop(borderRadius: BorderRadius.circular(10));

  static Decoration decorationTabsOnlyTop(
      {BorderRadiusGeometry? borderRadius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: injector<ServicesLocator>().appContext.scaffoldBackgroundColor,
    );
  }

  static BoxDecoration kDecorationBottomRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius ?? 25),
        bottomRight: Radius.circular(radius ?? 25),
      ),
    );
  }

  static BoxDecoration kDecorationBottomBorder({
    Color? color,
    Color? borderColor,
    double? width,
  }) {
    return BoxDecoration(
      color: color,
      border: Border(
        bottom: BorderSide(
          color: borderColor ??
              injector<ServicesLocator>().appContext.dividerColor,
          width: 0.8,
        ),
      ),
    );
  }

  static BoxDecoration kDecorationTopBorder({
    Color? color,
    Color? borderColor,
    double? width,
  }) {
    return BoxDecoration(
      color: color,
      border: Border(
        top: BorderSide(
          color: borderColor ??
              injector<ServicesLocator>().appContext.dividerColor,
          width: width ?? 0.8,
        ),
      ),
    );
  }

  static BoxDecoration kDecorationBorderRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      border: Border.all(
        color:
            borderColor ?? injector<ServicesLocator>().appContext.dividerColor,
        width: borderWidth ?? 1.0,
      ),
    );
  }

  static BoxDecoration kDecorationLinearGradient({
    Color? color,
    double? radius,
    Color? borderColor,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    double? borderWidth,
    required List<Color> colors,
    double? t,
  }) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        border: Border.all(
          color: borderColor ??
              injector<ServicesLocator>().appContext.dividerColor,
          width: borderWidth ?? 1.0,
        ),
        gradient: LinearGradient(
            begin: begin ?? Alignment.bottomRight,
            end: end ?? Alignment.topLeft,
            colors: colors));
  }

  static BoxDecoration kDecorationRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    final appContext = injector<ServicesLocator>().appContext;
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(
          radius ?? 12,
        )),
        border: Border.all(
            color: borderColor ?? appContext.cardColor, width: borderWidth ?? 1.0));
  }

  static BoxDecoration kDecorationRadiusAndImage({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
    String? image,
  }) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        image:
            DecorationImage(image: AssetImage(image ?? ""), fit: BoxFit.cover));
  }

  static BoxDecoration boxShape({
    required Color color,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }

  static ShapeDecoration shapeDecorationShadow(
      {Color? color,
      Color? colorShadow,
      double? radius,
      BorderRadiusGeometry? borderRadius}) {
    final appContext = injector<ServicesLocator>().appContext;
    return ShapeDecoration(
      color: color ?? appContext.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12)),
      shadows: [
        BoxShadow(
          color: colorShadow ?? appContext.shadowColor.withOpacity(0.06),
          blurRadius: 8,
          offset: const Offset(0, 2),
          spreadRadius: 0,
        )
      ],
    );
  }

  static ShapeDecoration shapeBottomShadow(
      {required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.05),
          blurStyle: BlurStyle.solid,
          offset: const Offset(100, 100),
        )
      ],
    );
  }

  static ShapeDecoration shapeTopShadow(
      {required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.2),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration decorationBorderShadow(
      {Color? color,
      required Color borderColor,
      required Color colorShadow,
      double? radius}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius ?? 12),
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration decorationStartEndRadiusBorder(
      {Color? color,
      Color? borderColor,
      double? radiusStart,
      double? radiusEnd}) {
    return BoxDecoration(
      color: color,
      borderRadius: startEndRadiusBorder(
        topStart: radiusStart ?? 8,
        bottomStart: radiusStart ?? 8,
        topEnd: radiusEnd ?? 0,
        bottomEnd: radiusEnd ?? 0,
      ),
      border: Border.all(
        color: injector<ServicesLocator>().appContext.primaryColor,
        width: 1.0,
      ),
    );
  }

  static BoxDecoration decorationStartEndBorder(
      {Color? color,
      double? topStart,
      double? topEnd,
      double? bottomStart,
      double? bottomEnd}) {
    return BoxDecoration(
      color: color,
      borderRadius: startEndRadiusBorder(
        topStart: topStart ?? 0,
        bottomStart: bottomStart ?? 0,
        topEnd: topEnd ?? 0,
        bottomEnd: bottomEnd ?? 0,
      ),
    );
  }

  static BorderRadiusGeometry startEndRadiusBorder(
      {double? topStart,
      double? topEnd,
      double? bottomStart,
      double? bottomEnd}) {
    return BorderRadiusDirectional.only(
      topStart: Radius.circular(topStart ?? 10),
      bottomStart: Radius.circular(bottomStart ?? 0),
      bottomEnd: Radius.circular(bottomEnd ?? 0),
      topEnd: Radius.circular(topEnd ?? 0),
    );
  }

  static BoxDecoration kDecorationCircleBorderRadius({
    Color? color,
    Color? borderColor,
    double? borderWidth,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(
        color:
            borderColor ?? injector<ServicesLocator>().appContext.dividerColor,
        width: borderWidth ?? 1.0,
      ),
    );
  }
}
