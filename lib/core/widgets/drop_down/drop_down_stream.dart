import 'package:app/core/widgets/texts/hint_texts.dart';

import '../../../src/main_index.dart';
import 'drop_down.dart';
import 'loading_widget.dart';

class DropDownFieldStream extends BaseStatelessWidget {
  final StreamStateInitial<List<DropDownItem>?> stream;
  final String? title;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem) onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final Color? colorBorderSide;
  final Color? fillColor;
  final TextStyle? hintStyle;

  DropDownFieldStream(
      {Key? key,
      required this.stream,
      this.title,
      this.hint,
      required this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.colorBorderSide,
      this.fillColor,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DropDownItem>?>(
      stream: stream.stream,
      initialData: [],
      builder: (context, snapshot) {
        return snapshot.data == null
            ? LoadingDropDown(hint: hint, title: title,)
            : DropDownField(
                items: snapshot.data ?? [],
                hint: hint,
                title: title,
                value: value,
                onChanged: onChanged,
              );
      },
    );
  }
}

class DropDownFieldChanged extends BaseStatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem) onChanged;
  final bool isValidator;
  final bool isLoading;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final Color? colorBorderSide;
  final Color? fillColor;
  final TextStyle? hintStyle;

  DropDownFieldChanged(
      {Key? key,
      required this.items,
      this.title,
      this.hint,
      required this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isLoading = false,
      this.isValidator = true,
      this.validator,
      this.style,
      this.colorBorderSide,
      this.fillColor,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingDropDown(hint: hint, title: title)
        : DropDownField(
            title: title,
            items: items,
            hint: hint,
            value: value,
            onChanged: onChanged,
          );
  }
}

class LoadingDropDown extends StatelessWidget {
  final String? title;
  final String? hint;

  LoadingDropDown({
    Key? key,
    this.title,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: context.bodySmall.copyWith(fontSize: 18),
          ),
          5.ph,
        ],
        Container(
          margin: 2.paddingVert,
          padding: 16.paddingHoriz + 18.paddingVert,
          decoration: Decorations.kDecorationBorderRadius(
              borderColor: context.dividerColor, color: context.scaffoldBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HintRegularText(label: hint ?? ''),
              const SmallLoading(),
            ],
          ),
        ),
      ],
    );
  }
}
