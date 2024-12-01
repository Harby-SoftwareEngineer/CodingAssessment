
import 'package:app/core/components/base_widget_bloc.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../bloc/change_mobile_number_bloc.dart';
import 'change_mobile_number_screen.dart';

class ChangeMobileNumberPage extends BaseBlocWidget<UnInitState, ChangeMobileNumberCubit> {
  ChangeMobileNumberPage({Key? key}) : super(key: key);


   String phone = '';

   @override
  String? title(BuildContext context) {
    return strings.change_phone_number;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ChangeMobileNumberScreen(
      onEnterPhoneNumber: (  phoneNumber) {
        phone = phoneNumber.phone??"";
        bloc.enterPhoneNumber(phoneNumber);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.changePhoneVerifyOtpPage, arguments: phone);
  }
}
