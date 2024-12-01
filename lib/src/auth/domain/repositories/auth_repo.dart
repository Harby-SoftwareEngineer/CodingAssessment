
import 'package:app/core/widgets/drop_down/drop_down.dart';

import '../../../profile/domain/entities/profile.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/verification_code_params.dart';


abstract class AuthRepo {
  Future<Profile> login(LoginParams params);
  Future<String> register(RegisterParams params);
}
