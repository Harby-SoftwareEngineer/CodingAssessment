import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../../core/widgets/texts/hint_texts.dart';
import '../../../../../core/widgets/texts/primary_texts.dart';
import '../../../../main_index.dart';
import '../../../../../core/widgets/text-field/custom_pin_code.dart';

class EnterPinCodeScreen extends BaseStatelessWidget {
  final Function(String) onPinCode;

  EnterPinCodeScreen({Key? key, required this.onPinCode}) : super(key: key);
  TextEditingController pinCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  StreamStateInitial<bool> isSendAgain = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.ph,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: HintRegularText(
                label: strings.forgot_password_verification_msg,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            30.ph,
            CustomPinCode(
              pinCodeController: pinCodeController,
            ),
            30.ph,
            timer(),
            12.ph,
            resendButton(),
            25.ph,
            PasswordTextField(
              hintText: strings.new_password,
              controller: newPasswordController,
              margin: 10.paddingTop,
            ),
            PasswordTextField(
              hintText: strings.confirm_new_password,
              controller: confirmNewPasswordController,
              margin: 20.paddingTop,
            ),
            PrimaryButton(
              title: strings.confirm,
              margin: 60.paddingTop,
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                  onPinCode(pinCodeController.text);
                // }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HintRegularText(label: strings.time_lift),
        10.pw,
        Directionality(
          textDirection: TextDirection.ltr,
          child: TimerCountdown(
            format: CountDownTimerFormat.minutesSeconds,
            timeTextStyle: primaryRegularStyle,
            colonsTextStyle: primaryRegularStyle,
            enableDescriptions: false,
            spacerWidth: 0,
            endTime: DateTime.now().add(
              const Duration(
                seconds: 60,
              ),
            ),
            onEnd: () {
              isSendAgain.setData(true);
            },
          ),
        ),
      ],
    );
  }

  Widget resendButton() {
    return StreamBuilder<bool>(
      stream: isSendAgain.stream,
      builder: (context, snapshot) {
        return
          // isSendAgain.data == null
          //   ? const SizedBox()
          //   :
          TextButton(
                child: PrimaryRegularText(
                  label: strings.send_again,
                  labelStyle: primaryRegularStyle.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  )
                ),
                onPressed: () {},
              );
      },
    );
  }
}
