
import 'package:app/core/components/base_widget_bloc.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../auth/presentation/pages/forget-password/enter_phone_number_screen.dart';
import '../../../../main_index.dart';
import '../../../data/models/change_password_params.dart';
import '../../bloc/change_password_bloc.dart';

class ChangePasswordSendOtpPage extends BaseBlocWidget<UnInitState, ChangePasswordCubit> {
  ChangePasswordSendOtpPage({Key? key}) : super(key: key);


   String phone = '';

   @override
  String? title(BuildContext context) {
    return strings.change_password;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EnterPhoneNumberScreen(
      onEnterPhoneNumber: (  phoneNumber) {
        phone = phoneNumber.phone ?? "";
        bloc.changePassword(ChangePasswordParams());
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.changePasswordVerifyOtpPage, arguments: phone);
  }
}
