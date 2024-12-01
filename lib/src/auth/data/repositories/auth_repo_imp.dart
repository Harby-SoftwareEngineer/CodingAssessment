
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
    // params.firebaseDeviceId = await FirebaseNotification().getToken();
    final response = await apiProvider.signUp(params, 'AIzaSyDYAuhhlRGHa8G3gciUHooBuoP4YCVj7Ag');
    print('response: $response');
    // await HelperMethods.saveProfile(response);
    return Profile();
  }

  @override
  Future<String> register(RegisterParams params) async {
    // params.fcmToken = await FirebaseNotification().getToken();
    FormData formData = FormData();
    formData.fields.addAll(params.toJson().entries.map((e) => MapEntry(e.key, e.value.toString())));
    formData.files.add(MapEntry('File', MultipartFile.fromFileSync(params.passportFile!.path)));
    // final response = await apiProvider.register(formData);
    // await HelperMethods.saveProfile(response);
    return '';
  }
}
