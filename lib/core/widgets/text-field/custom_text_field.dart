import 'package:app/core/widgets/texts/primary_texts.dart';
import 'package:app/src/main_index.dart';

import '../texts/black_texts.dart';
import '../texts/white_texts.dart';


class CustomTextField extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? title;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? prefixIconPath;
  final String ? suffixIconPath;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final double radius;
  final bool? isValidator;
  final double? minHeight;
  final bool enabled;
    CustomTextField({Key? key, this.controller, this.hintText, this.title, this.isPassword = false, this.onTap, this.onChanged, this.validator, this.inputDecoration, this.keyboardType, this.fillColor, this.hintStyle, this.textAlign, this.prefixIcon, this.maxLines, this.colorBorderSide, this.margin, this.contentPadding, this.suffixIcon, this.radius = 8, this.prefixIconPath, this.suffixIconPath, this.isValidator = true, this.minHeight, this.enabled = true }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVisibility = isPassword;
    // if
    Color borderColor = colorBorderSide ?? context.theme.inputDecorationTheme.border!.borderSide.color;
    return Padding(
      padding: margin ?? 15.paddingBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
        WhiteMediumText(label: title!, fontSize: 16),
            8.ph],
          SizedBox(
            height: minHeight,
            child:  StatefulBuilder(
                builder: (context, setState) {
                return TextFormField(
                  onTap: onTap,
                  readOnly: onTap != null,
                  enabled: enabled,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textAlign: textAlign ?? TextAlign.start,
                  maxLines: maxLines ?? 1,
                  keyboardType: isPassword ? TextInputType.visiblePassword : keyboardType,
                  style: enabled ? whiteRegularStyle.copyWith(fontSize: 14) : hintRegularStyle.copyWith(fontSize: 16),
                  obscureText: isVisibility,
                  controller: controller,
                  textInputAction: TextInputAction.next,
                  cursorColor: context.primaryColor,
                  inputFormatters: [
                    if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: inputDecoration ?? InputDecoration(
                    labelText: hintText,
                    hintText: hintText,
                    hintStyle: hintStyle,
                    fillColor: fillColor ?? context.theme.inputDecorationTheme.fillColor,
                    filled: true,
                    contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    // prefixIconConstraints:  BoxConstraints(
                    //   minWidth: minHeight?? 35,
                    //   minHeight: minHeight ?? 35,
                    // ),
                    prefixIcon:  prefixIconPath != null ? AppIcon(
                      padding: const EdgeInsets.all(12),
                      icon: prefixIconPath!,  size: 20,) : prefixIcon,
                    suffixIcon: isPassword ?
                    IconButton(
                      icon: Icon(
                        isVisibility ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: isVisibility ? hintColor : primaryColorDark,
                      ),
                      onPressed: () {
                        isVisibility = !isVisibility;
                        setState(() {});
                      },
                    ) :
                    (suffixIconPath != null ? AppIcon(
                        padding: const EdgeInsets.all(12),
                        icon: suffixIconPath!, size: 0) : suffixIcon),
                    // contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius:  BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: primaryColor, width: 1.5),
                    ),

                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: errorColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                  validator: (isValidator! &&  validator == null) ? (value) {
                    if (value == null || value.isEmpty) {
                      return context.getStrings().this_field_is_required;
                    }
                    return null;
                  } : validator,
                  onChanged: onChanged,
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
