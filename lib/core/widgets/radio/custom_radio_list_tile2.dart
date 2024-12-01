import 'package:app/src/main_index.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile2 extends StatelessWidget {
  final String title;
  final String groupValue;
  final Function(String?) onChanged;
  const CustomRadioListTile2(
      {Key? key,
      required this.title,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Radio(
          activeColor: theme.colorScheme.secondary,
          value: title,
          groupValue: groupValue,
          fillColor: MaterialStateProperty.all(context.primaryColor),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          onChanged: onChanged,
        ),
        Text(title, style: context.bodyMedium),
      ],
    );
  }
}
