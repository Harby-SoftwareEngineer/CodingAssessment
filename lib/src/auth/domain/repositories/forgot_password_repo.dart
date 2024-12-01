
import '../../../settings/data/models/change_password_params.dart';
import '../../data/models/forgot_password_params.dart';
import '../../data/models/reset_password_params.dart';



abstract class ForgotPasswordRepo {
  Future<String> enterPhoneNumber(ForgotPasswordParams params);
  Future<String> resetPassword(ResetPasswordParams params);
  Future<String> updatePassword(ChangePasswordParams params);
  Future<String> logout();
}
