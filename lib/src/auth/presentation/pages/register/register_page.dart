import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
 import '../../../data/models/register_params.dart';
import '../../bloc/auth_bloc.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseBlocWidget<DoubleDataSuccess, AuthCubit> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchInitialData();
  }


  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    return RegisterScreen(
      countries: state.data1!,
      currencies: state.data2!,
      onRegister: (RegisterParams params) {
        bloc.register(params);
      },
    );
  }
  @override
  String? title(BuildContext context) {
    return '';
  }
  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
