import 'dart:io';

import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../src/main_index.dart';
import '../../utils/helper_methods.dart';
import 'custom_text_field.dart';

class SearchTextField extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  SearchTextField({Key? key, this.title, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title,
      hintText: hintText ?? strings.search,
      isValidator: false,
      suffixIconPath: AppIcons.search_circle,
    );
  }
}