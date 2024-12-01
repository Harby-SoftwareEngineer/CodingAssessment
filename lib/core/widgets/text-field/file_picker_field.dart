
import 'dart:io';

import 'package:app/core/utils/helper_methods.dart';
import 'package:app/core/widgets/text-field/custom_text_field.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../src/main_index.dart';
import '../../resources/validation.dart';

class FilePickerField extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final Function(File)? onFileSelected;
  FilePickerField({Key? key, this.title, this.hintText, this.onFileSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return CustomTextField(
      controller: controller,
      title: title ?? 'File',
      // hintText: hintText ?? 'Select file',
        suffixIcon: Icon(Icons.attach_file),
      // prefixIcon: Icon(Icons.attach_file),
      onTap: () async {
        CroppedFile? file = await HelperMethods.getImagePicker();
        if (file != null) {
          controller!.text = file.path.split('/').last;
          onFileSelected!(File(file.path));
        }
      }
    );
  }
}