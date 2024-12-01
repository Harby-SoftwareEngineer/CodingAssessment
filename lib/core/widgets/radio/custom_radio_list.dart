
import '../../../src/main_index.dart';
import '../texts/black_texts.dart';

class CustomRadioList extends StatelessWidget {
  final String title;
  final bool? isLast;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final Color? backgroundColor;
  final double? radius;
  final Widget? suffix;

  const CustomRadioList(
      {Key? key,
      required this.title,
      this.isLast = false,
      this.onChanged,
      required this.value,
      this.groupValue,
      this.backgroundColor,
      this.radius,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: BlackSemiBoldText(label: title ?? ''),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: context.primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
