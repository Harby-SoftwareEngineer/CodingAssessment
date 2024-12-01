
import '../entities/home_data.dart';

abstract class HomeRepo {
  Future<HomeData> fetchHomeData();
}