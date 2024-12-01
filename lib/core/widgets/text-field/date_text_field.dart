
import 'package:app/core/widgets/text-field/custom_text_field.dart';

import '../../../../src/main_index.dart';
import '../../resources/validation.dart';

class DateTextField extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  DateTextField({Key? key, this.title, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title ?? 'Date',
      suffixIcon: Icon(Icons.calendar_today),
      // hintText: hintText ?? strings.email,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        ).then((value) {
          if (value != null) {
            controller!.text = value.toString().split(' ')[0];
          }
        });
      }
    );
  }
}