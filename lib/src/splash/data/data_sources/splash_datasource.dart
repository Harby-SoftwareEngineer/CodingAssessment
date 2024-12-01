import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app/core/network/api_response.dart';

import '../../domain/entities/splash.dart';

part 'splash_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: 'kBASE_URL')
abstract class  SplashDatasource{

  @factoryMethod
  factory SplashDatasource(Dio dio) = _SplashDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<List<Splash>>> fetchSplashData();
}