import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../settings/data/models/change_password_params.dart';
import '../../data/models/forgot_password_params.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/verification_code_params.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/forgot_password_repo.dart';

@Injectable()
class ForgotPasswordCubit extends BaseCubit {
  final ForgotPasswordRepo repo;
  final AuthRepo authRepo;

  ForgotPasswordCubit(this.repo, this.authRepo);

  enterPhoneNumber(ForgotPasswordParams forgotPasswordParams) async {
    // executeEmitterListener(() => repo.enterPhoneNumber( forgotPasswordParams));
    emit(SuccessStateListener(''));
  }

  void verificationCode(VerificationCodeParams params) async {
  }

  forgotPassword(ResetPasswordParams params) async {
    executeEmitterListener(() => repo.resetPassword(params));
  }

  changePassword(ChangePasswordParams params) async {
    executeEmitterListener(() => repo.updatePassword(params));
  }
}
