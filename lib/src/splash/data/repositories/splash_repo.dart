
import 'package:injectable/injectable.dart';

import '../../domain/entities/splash.dart';
import '../../domain/repositories/base_splash_repo.dart';
import '../data_sources/splash_datasource.dart';


@Injectable(as: BaseSplashRepo)
class SplashRepo extends BaseSplashRepo{
  final SplashDatasource  datasource;
  SplashRepo(this.datasource);

  @override
  Future<List<Splash>> fetchSplashData() async {
    final response = await datasource.fetchSplashData();
    return response.result!;
  }

}