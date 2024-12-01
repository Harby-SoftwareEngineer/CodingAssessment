import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/verification_code_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_pin_code_screen.dart';

class EnterPinCodePage
    extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  EnterPinCodePage({Key? key}) : super(key: key);
  VerificationCodeParams? data;

  @override
  String? title(BuildContext context) {
    return strings.forgot_password;
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return EnterPinCodeScreen(
      onPinCode: (String code) {
        data=VerificationCodeParams( phoneNumber: getArguments(context),
          code: code,);
        bloc.verificationCode(VerificationCodeParams(
          phoneNumber: getArguments(context),
          code: code,
        ));
      },
    );
  }


  @override
  void onSuccessDismissed() {
    pushNamed(Routes.forgotPasswordPage, arguments: data);
  }
}
