import 'package:app/src/auth/data/models/login_params.dart';
import 'package:app/src/auth/data/models/register_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../models/update_profile_params.dart';

part 'firebase_auth_service.g.dart';

@Injectable()
@RestApi(baseUrl: "https://identitytoolkit.googleapis.com/v1/")
abstract class FirebaseAuthService {
  @factoryMethod
  factory FirebaseAuthService(Dio dio) = _FirebaseAuthService;

  @POST("accounts:signInWithPassword?key={apiKey}")
  Future<ProfileDto> signIn(
    @Body() LoginParams body,
    @Path("apiKey") String apiKey,
  );

  @POST("accounts:signUp?key={apiKey}")
  Future<ProfileDto> signUp(
    @Body() RegisterParams body,
    @Path("apiKey") String apiKey,
  );

  @POST("accounts:update?key={apiKey}")
  Future<ProfileDto> updateProfile(
      @Body() UpdateProfileParams body,
      @Path("apiKey") String apiKey,
      );
}
