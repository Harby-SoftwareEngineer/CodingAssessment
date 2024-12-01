import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../settings/data/models/change_password_params.dart';
import '../../../data/models/reset_password_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'forgot_password_screen.dart';

class ForgotPasswordPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  ForgotPasswordPage({Key? key}) : super(key: key);


  @override
  String? title(BuildContext context) => strings.change_password;


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ForgotPasswordScreen(
      onChangePassword: (ResetPasswordParams params) {
        bloc.forgotPassword(params);
      },
      verificationCodeParams: getArguments(context),
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.loginPage);
  }
}
