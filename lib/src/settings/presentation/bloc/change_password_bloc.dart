import 'package:app/core/resources/data_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../auth/domain/repositories/forgot_password_repo.dart';
import '../../../settings/data/models/change_password_params.dart';

@Injectable()
class ChangePasswordCubit extends BaseCubit {
  final ForgotPasswordRepo repo;

  ChangePasswordCubit(this.repo);
  void changePassword(ChangePasswordParams params) async {
    // executeEmitterListener(() => repo.updatePassword(params));
    emit(SuccessStateListener('data'));
  }
}
