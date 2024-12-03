
import 'package:app/core/widgets/images/logo.dart';

import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../../core/widgets/text-field/email_text_field.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onLogin;

  LoginScreen({Key? key, this.onLogin}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      emailController.text = 'admin@mail.com';
      passwordController.text = '123456';
    }
    return Form(
      key: formKey,
      child: Column(
        children: [
          (kToolbarHeight).ph,
          const Logo(),
          Expanded(
            child: SingleChildScrollView(
              padding: basePadding,
              child: Column(
                children: [
                  25.ph,
                  SelectionButtonChip(
                    types: [
                      ChipItem(id: '1', title: strings.sign_in),
                      ChipItem(id: '2', title: strings.sign_up),
                    ],
                    onSelected: (selected) {
                      isLogin = selected!.id == '1';
                    },
                  ),
                  20.ph,
                  EmailTextField(
                    controller: emailController,
                  ),
                  PasswordTextField(
                    controller: passwordController,
                    margin: 10.paddingTop,
                  ),
                  PrimaryButton(
                    title: strings.login,
                    margin: 60.paddingTop,
                    onPressed: () {
                      onPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressed() async {
    if (formKey.currentState!.validate()) {
      onLogin!(
        LoginParams(
          email: emailController.text,
          password: passwordController.text,
          isLogin: isLogin,
        ),
      );
    }
  }
}
