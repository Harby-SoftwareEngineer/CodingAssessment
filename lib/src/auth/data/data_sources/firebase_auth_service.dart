import 'package:app/src/auth/data/models/login_params.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../profile/data/models/profile_dto.dart';
part 'firebase_auth_service.g.dart';

@RestApi(baseUrl: "https://identitytoolkit.googleapis.com/v1/")
abstract class FirebaseAuthService {
  factory FirebaseAuthService(Dio dio, {String baseUrl}) = _FirebaseAuthService;

  @POST("accounts:signUp?key={apiKey}")
  Future<ProfileDto> signUp(
      @Body() LoginParams body,
      @Path("apiKey") String apiKey,
      );

  @POST("accounts:signInWithPassword?key={apiKey}")
  Future<ProfileDto> signIn(
      @Body() LoginParams body,
      @Path("apiKey") String apiKey,
      );
}