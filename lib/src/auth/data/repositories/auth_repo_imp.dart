
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:app/src/auth/data/models/login_params.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/firebase_auth_service.dart';
import '../models/register_params.dart';
import '../models/update_profile_params.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService apiProvider;

  AuthRepoImp(this.apiProvider);

  @override
  Future<Profile> login(LoginParams params) async {
    final response = await apiProvider.signIn(params, firebaseKey);
    print('response: $response');
    await HelperMethods.saveProfile(response);
    return Profile();
  }

  @override
  Future<String> register(RegisterParams params) async {
    final response = await apiProvider.signUp(params, firebaseKey);
    print('displayName: ${response.displayName}');
    await HelperMethods.saveProfile(response);
    return '';
  }

  Future<void> updateDisplayName(String username) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
  }
}
