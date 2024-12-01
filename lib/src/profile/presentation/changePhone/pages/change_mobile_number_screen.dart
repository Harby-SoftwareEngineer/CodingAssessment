
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/text-field/mobile_text_field.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../../core/widgets/texts/hint_texts.dart';
import '../../../../auth/data/models/forgot_password_params.dart';
import '../../../../main_index.dart';

class ChangeMobileNumberScreen extends BaseStatelessWidget {
  final Function(ForgotPasswordParams forgotPasswordParams) onEnterPhoneNumber;

  ChangeMobileNumberScreen({Key? key, required this.onEnterPhoneNumber})
      : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HintRegularText(
                label: strings.forgot_password_mobile_message,
                fontSize: 16,
            ),
            20.ph,
            PasswordTextField(
              controller: passwordController,
            ),
            MobileTextField(
              hintText: strings.new_mobile_number,
              controller: mobileNumberController,
            ),
            PrimaryButton(
              title: strings.confirm,
              margin: 50.paddingTop + 10.paddingBottom,
              radius: 8,
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                  onEnterPhoneNumber(
                      ForgotPasswordParams(phone: ''));
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
