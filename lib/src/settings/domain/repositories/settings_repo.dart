
import '../entities/about.dart';

abstract class SettingsRepo {
  Future<About> fetchTermsConditions();
}
