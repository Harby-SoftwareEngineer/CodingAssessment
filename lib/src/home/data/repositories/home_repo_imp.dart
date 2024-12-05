
import 'package:injectable/injectable.dart';

import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_datasource.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp extends HomeRepo {
  final HomeDatasource datasource;

  HomeRepoImp(this.datasource);

  @override
  Future<HomeData> fetchHomeData() async {
    return HomeData();
  }
}
