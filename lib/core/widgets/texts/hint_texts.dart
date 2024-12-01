import '../../../src/main_index.dart';

class HintBoldText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  HintBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
          context.displayLarge.copyWith(fontSize: fontSize ?? 16, color: labelColor, fontWeight: FontWeight.bold),
    );
  }
}

class HintRegularText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  HintRegularText({
    Key? key,
    required String this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
          context.displaySmall.copyWith(fontSize: fontSize ?? 14, color: labelColor),
    );
  }
}

class HintMediumText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  HintMediumText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style ??
          context.displayMedium.copyWith(fontSize: fontSize ?? 16, color: labelColor),
    );
  }
}

class HintSemiBoldText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;

  HintSemiBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: style ??
          context.displayLarge.copyWith(fontSize: fontSize ?? 16, color: labelColor),
    );
  }
}