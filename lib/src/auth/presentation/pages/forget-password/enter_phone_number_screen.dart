import 'package:app/core/widgets/texts/hint_texts.dart';

import '../../../../../core/widgets/text-field/email_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/forgot_password_params.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final Function(ForgotPasswordParams forgotPasswordParams) onEnterPhoneNumber;

  EnterPhoneNumberScreen({Key? key, required this.onEnterPhoneNumber})
      : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<bool> isEmailStream = StreamStateInitial<bool>();
    return SingleChildScrollView(
      padding: basePadding,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: 20.paddingAll,
              decoration: Decorations.shapeDecorationShadow(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HintRegularText(
                      label: strings.forgot_password_email_message,
                      fontSize: 16),
                  20.ph,
                  EmailTextField(
                    controller: phoneNumberController,
                  ),
                ],
              ),
            ),

            PrimaryButton(
              title: strings.confirm,
              margin: 50.paddingTop + 10.paddingBottom,
              radius: 8,
              elevation: 5,
              onPressed: () {
                print(phoneNumberController.text);
                print("phoneNumberControlle-----------------");
                // if (formKey.currentState!.validate()) {
                onEnterPhoneNumber(
                    ForgotPasswordParams(phone: phoneNumberController.text));
                // }

                // pushNamed(Routes.enterPinCodePage, arguments: '');
              },
            ),
          ],
        ),
      ),
    );
  }
}
