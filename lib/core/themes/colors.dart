
import 'package:app/src/main_index.dart';

class AppColors {
  static const Color primaryDark = Color(0xff000000);
  static const Color primaryLightText = Color(0xff1E3350);
  static const Color primaryLight = Color(0xff4E4AF2);
  static const Color errorColor = Color(0xffF40000);
  static const Color greenColor = Color(0xff219653);
  static const Color backgroundColor = Color(0xff242C3B);
  static const Color cardColor = Color(0xffffffff);
  static const Color whiteText = Color(0xffffffff);
  static const Color borderColor = Color(0xffADB5C3);
  static const Color borderTextFieldColor = Color(0xff9B9DA3);
  static Color greyColor = Color(0xffffffff).withOpacity(0.6);
  static const Color greyColorAC = Color(0xff9B9DAC);
  static const Color dividerColor = Color(0xffADB5C3);
  static const Color blueColor = Color(0xff0276D9);
  static const Color cafColor = Color(0xff8DDBE5);
  static const Color cafColor2 = Color(0xff307EBC);
  static const Color orangeColor =  Color(0xffFF6B00);
  static const Color blueColorff = Color(0xff0085FF);
  static const Color orangeLight = Color(0xffFFE9D4);
  static const Color blackColor = Color(0xff2A2A2A);
  static const Color greysColor = Color(0xffE2E5EB);
}


extension AppColor on BuildContext{
  // bool isDark() => Theme.of(this).brightness == Brightness.dark;
  // Color get blue_E0 => isDark() ? const Color(0xFF83BAE0) : const Color(0xFF83BAE0);
  // Color get blue_EC => isDark() ? const Color(0xFF7FC0EC) : const Color(0xFF7FC0EC);
  // Color get blue_D9 => isDark() ? const Color(0xFF0082D9) : const Color(0xFF0082D9);
  // Color get blue_E8 => isDark() ? const Color(0xFF0082D9) : const Color(0xFF66B4E8);
  // Color get green_45 => isDark() ? const Color(0xFF1AA945) : const Color(0xFF1AA945);
}