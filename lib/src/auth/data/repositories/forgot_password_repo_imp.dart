import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../settings/data/models/change_password_params.dart';
import '../../domain/repositories/forgot_password_repo.dart';
import '../data_sources/forgot_password_datasource.dart';
import '../models/forgot_password_params.dart';
import '../models/reset_password_params.dart';

@Injectable(as: ForgotPasswordRepo)
class ForgotPasswordRepoImp extends ForgotPasswordRepo {
  final ForgotPasswordDataSource apiProvider;
  ForgotPasswordRepoImp(this.apiProvider);

  @override
  Future<String> enterPhoneNumber(ForgotPasswordParams params) async {
    final response = await apiProvider.enterPhoneNumber(params);
    return response.message ?? '';
  }

  @override
  Future<String> resetPassword(ResetPasswordParams params) async {
    final response = await apiProvider.resetPassword(params);
    return response.message ?? '';
  }

  @override
  Future<String> updatePassword(ChangePasswordParams params) async {
    final response = await apiProvider.updatePassword(params);
    return response.message ?? '';
  }

  @override
  Future<String> logout() async {
    final response = await apiProvider.logout();
    await HelperMethods.clearCashData();
    return response.message ?? '';
  }
}
