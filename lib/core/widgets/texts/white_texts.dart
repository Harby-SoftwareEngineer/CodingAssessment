import '../../../src/main_index.dart';

class WhiteBoldText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  WhiteBoldText({
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
          whiteBoldStyle.copyWith(fontSize: fontSize ?? 18, color: labelColor),
    );
  }
}

class WhiteRegularText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  WhiteRegularText({
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
          whiteRegularStyle.copyWith(fontSize: fontSize ?? 14, color: labelColor),
    );
  }
}

class WhiteMediumText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;
  final int maxLines;
  final TextOverflow overflow;

  WhiteMediumText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: labelStyle ??
          whiteMediumStyle.copyWith(fontSize: fontSize ?? 16, color: labelColor),
    );
  }
}

class WhiteSemiBoldText extends BaseStatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  WhiteSemiBoldText({
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
         whiteSemiBoldStyle.copyWith(fontSize: fontSize ?? 16, color: labelColor),
    );
  }
}