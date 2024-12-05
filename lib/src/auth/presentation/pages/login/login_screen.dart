
import 'package:app/core/widgets/images/logo.dart';
import 'package:app/core/widgets/text-field/custom_text_field.dart';

import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../../../core/widgets/text-field/email_text_field.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';
import '../../../data/models/register_params.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onLogin;
  final Function(RegisterParams)? onRegister;

  LoginScreen({Key? key, this.onLogin, this.onRegister}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamStateInitial<bool> isLoginStream = StreamStateInitial();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      nameController.text = 'Admin';
      emailController.text = 'admin@gmail.com';
      passwordController.text = '123456';
    }
    return Form(
      key: formKey,
      child: Column(
        children: [
          (kToolbarHeight + 20).ph,
          const Logo(),
          Expanded(
            child: SingleChildScrollView(
              padding: basePadding,
              child: Column(
                children: [
                  50.ph,
                  SelectionButtonChip(
                    types: [
                      ChipItem(id: '1', title: strings.sign_in),
                      ChipItem(id: '2', title: strings.sign_up),
                    ],
                    onSelected: (selected) {
                      isLogin = selected!.id == '1';
                      isLoginStream.setData(isLogin);
                    },
                  ),
                  30.ph,
                    StreamBuilder<bool>(
                      initialData: isLogin,
                      stream: isLoginStream.stream,
                      builder: (context, snapshot) {
                        return snapshot.data!
                            ? 0.phShrink
                            :
                          CustomTextField(
                            title: strings.name,
                          controller: nameController,
                        );
                      }
                    ),
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
      if (isLogin) {
        onLogin!(
          LoginParams(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        return;
      } else {
        onRegister!(
          RegisterParams(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      }
    }
  }
}
