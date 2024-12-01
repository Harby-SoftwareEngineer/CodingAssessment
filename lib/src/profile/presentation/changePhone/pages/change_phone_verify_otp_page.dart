import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../auth/data/models/forgot_password_params.dart';
import '../../../../auth/data/models/verification_code_params.dart';
import '../../../../main_index.dart';
import '../bloc/change_mobile_number_bloc.dart';
import 'change_phone_verify_otp_screen.dart';

class ChangePhoneVerifyOtpPage
    extends BaseBlocWidget<UnInitState, ChangeMobileNumberCubit> {
  ChangePhoneVerifyOtpPage({Key? key}) : super(key: key);
  VerificationCodeParams? data;

  @override
  String? title(BuildContext context) {
    return strings.change_phone_number;
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return ChangePhoneVerifyOtpScreen(
      onPinCode: (String code) {
        data=VerificationCodeParams( phoneNumber: getArguments(context),
          code: code,);
        bloc.enterPhoneNumber(ForgotPasswordParams());
      },
    );
  }


  @override
  void onSuccessDismissed() {
    pushNamed(Routes.navigationPages, arguments: data);
  }
}
