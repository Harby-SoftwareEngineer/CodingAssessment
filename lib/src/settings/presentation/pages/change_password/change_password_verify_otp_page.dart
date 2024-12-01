import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../auth/data/models/verification_code_params.dart';
import '../../../../auth/presentation/pages/forget-password/enter_pin_code_screen.dart';
import '../../../../main_index.dart';
import '../../../data/models/change_password_params.dart';
import '../../bloc/change_password_bloc.dart';

class ChangePasswordVerifyOtpPage
    extends BaseBlocWidget<UnInitState, ChangePasswordCubit> {
  ChangePasswordVerifyOtpPage({Key? key}) : super(key: key);
  VerificationCodeParams? data;

  @override
  String? title(BuildContext context) {
    return strings.change_password;
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return EnterPinCodeScreen(
      onPinCode: (String code) {
        data=VerificationCodeParams( phoneNumber: getArguments(context),
          code: code,);
        bloc.changePassword(ChangePasswordParams());
      },
    );
  }


  @override
  void onSuccessDismissed() {
    pushNamed(Routes.navigationPages);
  }
}
