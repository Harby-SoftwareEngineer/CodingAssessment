
import 'package:app/core/widgets/text-field/custom_text_field.dart';

import '../../../../src/main_index.dart';
import '../../resources/validation.dart';

class EmailTextField extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  EmailTextField({Key? key, this.title, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title ?? strings.email,
      // hintText: hintText ?? strings.email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validation.validateEmail(value!),
    );
  }
}