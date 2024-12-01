import 'dart:io';

import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../src/main_index.dart';
import '../../utils/helper_methods.dart';
import 'custom_text_field.dart';

class MobileTextField extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  MobileTextField({Key? key, this.title, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title ?? strings.mobile_number,
      hintText: hintText,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return strings.this_field_is_required;
        } else if (value.length < 9) {
          return strings.must_be_more_than_6_digits;
        }
        return null;
      },
    );
  }
}