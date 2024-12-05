import 'package:app/core/resources/validation.dart';

import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/change_password_params.dart';

class ChangePasswordScreen extends BaseStatelessWidget {
  final Function(ChangePasswordParams) onChangePassword;

  ChangePasswordScreen({Key? key, required this.onChangePassword})
      : super(key: key);

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        padding: 16.paddingAll,
        child: Column(
          children: [
            40.ph,
            CustomTextField(
              controller: oldPasswordController,
              title: strings.current_password,
              isPassword: true,
            ),
            CustomTextField(
              controller: newPasswordController,
              title: strings.new_password,
              isPassword: true,
            ),
            CustomTextField(
              controller: confirmNewPasswordController,
              title: strings.confirm_new_password,
              isPassword: true,
              validator: (value)=> Validation.validateConfirmPassword(value ?? '', newPasswordController.text),
            ),
            PrimaryButton(
              title: strings.confirm,
              margin: 40.paddingTop,
              onPressed: () {
                onSelectedPressed();
              },
            ),
          ],
        ),
      ),
    );
  }

  onSelectedPressed() async {
    if (_key.currentState!.validate()) {
      onChangePassword(ChangePasswordParams(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmNewPasswordController.text,
      ));
    }
  }
}
