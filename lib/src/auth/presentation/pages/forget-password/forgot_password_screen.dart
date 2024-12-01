import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';
import '../../../../settings/data/models/change_password_params.dart';
import '../../../data/models/forgot_password_params.dart';
import '../../../data/models/reset_password_params.dart';
import '../../../data/models/verification_code_params.dart';

class ForgotPasswordScreen extends BaseStatelessWidget {
  final Function(ResetPasswordParams) onChangePassword;
  final VerificationCodeParams? verificationCodeParams;
  ForgotPasswordScreen({Key? key, required this.onChangePassword, required this.verificationCodeParams})
      : super(key: key);

  TextEditingController currentPasswordController = TextEditingController();
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

            CustomTextField(
              controller: newPasswordController,
              hintText: strings.new_password,
              isPassword: true,
            ),
            CustomTextField(
              controller: confirmNewPasswordController,
              hintText: strings.confirm_new_password,
              isPassword: true,
            ),
            PrimaryButton(
              title: strings.save,
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
      onChangePassword(ResetPasswordParams(
         newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmNewPasswordController.text,
        phone: verificationCodeParams?.phoneNumber??"",
        otp: verificationCodeParams?.code,
      ));
    }
  }
}
