import 'package:app/core/resources/data_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../auth/data/models/forgot_password_params.dart';
import '../../../domain/repositories/profile_repo.dart';


@Injectable()
class ChangeMobileNumberCubit extends BaseCubit {
  final ProfileRepo repo;

  ChangeMobileNumberCubit(this.repo);

  enterPhoneNumber(ForgotPasswordParams forgotPasswordParams) async {
    emit(SuccessStateListener(''));
  }
}
