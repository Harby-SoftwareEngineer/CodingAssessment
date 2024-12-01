import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../data/models/change_password_params.dart';
import '../../../../main_index.dart';
import '../../bloc/change_password_bloc.dart';
import 'change_password_screen.dart';

class ChangePasswordPage extends BaseBlocWidget<UnInitState, ChangePasswordCubit> {
  ChangePasswordPage({Key? key}) : super(key: key);


  @override
  String? title(BuildContext context) => strings.change_password;


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ChangePasswordScreen(
      onChangePassword: (ChangePasswordParams params) {
        bloc.changePassword(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pop();
  }
}
