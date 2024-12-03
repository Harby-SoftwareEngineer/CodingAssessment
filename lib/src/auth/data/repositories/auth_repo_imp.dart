
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app/src/auth/data/models/login_params.dart';

import '../../../profile/domain/entities/profile.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/firebase_auth_service.dart';
import '../models/register_params.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService apiProvider;

  AuthRepoImp(this.apiProvider);

  @override
  Future<Profile> login(LoginParams params) async {
    final response = await apiProvider.signIn(params, 'AIzaSyDYAuhhlRGHa8G3gciUHooBuoP4YCVj7Ag');
    print('response: $response');
    // await HelperMethods.saveProfile(response);
    return Profile();
  }

  @override
  Future<String> register(LoginParams params) async {
    final response = await apiProvider.signUp(params, 'AIzaSyDYAuhhlRGHa8G3gciUHooBuoP4YCVj7Ag');
    // final response = await apiProvider.register(formData);
    // await HelperMethods.saveProfile(response);
    return '';
  }
}
