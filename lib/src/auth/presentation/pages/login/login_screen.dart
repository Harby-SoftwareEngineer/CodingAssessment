import 'package:app/core/utils/helper_methods.dart';
import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/images/logo.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';

import '../../../../../core/widgets/buttons/label_button.dart';
import '../../../../../core/widgets/text-field/email_text_field.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../../core/widgets/texts/black_texts.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onLogin;

  LoginScreen({Key? key, this.onLogin}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      emailController.text = 'admin@mail.com';
      passwordController.text = '123456';
    }
    StreamStateInitial<bool> isEmailStream = StreamStateInitial<bool>();
    return Form(
      key: formKey,
      child: Material(
        color: scaffoldBackgroundColor,
        child: Column(
          children: [
            (kToolbarHeight - 20).ph,
            const Logo(),
            Expanded(
              child: Container(
                margin: 20.paddingTop,
                padding: 20.paddingAll,
                decoration: Decorations.kDecorationTopRadius(radius: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlackBoldText(
                        label: strings.sign_in,
                        fontSize: 20,
                      ),
                      25.ph,
                      EmailTextField(
                        controller: emailController,
                      ),
                      PasswordTextField(
                        controller: passwordController,
                        margin: 10.paddingTop,
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LabelButton(
                            title: strings.forgot_password,
                            style: primaryMediumStyle.copyWith(fontSize: 14),
                            onTap: () {
                              pushNamed(Routes.enterPhoneNumberPage);
                            },
                          ),
                        ],
                      ),
                      PrimaryButton(
                        title: strings.login,
                        margin: 60.paddingTop,
                        onPressed: () {
                          onPressed();
                        },
                      ),
                      20.ph,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HintMediumText(
                            label: 'Don\'t have an account?',
                            // style: primaryMediumStyle.copyWith(fontSize: 14),
                          ),
                          10.pw,
                          LabelButton(
                            title: 'Sign up',
                            style: primaryMediumStyle.copyWith(fontSize: 14),
                            onTap: () {
                              pushNamed(Routes.register);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPressed() async {
    if (formKey.currentState!.validate()) {
      onLogin!(
        LoginParams(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
