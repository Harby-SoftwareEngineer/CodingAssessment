import '../../src/auth/presentation/pages/forget-password/enter_phone_number_page.dart';
import '../../src/auth/presentation/pages/forget-password/enter_pin_code_page.dart';
import '../../src/auth/presentation/pages/forget-password/forgot_password_page.dart';
 import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/cart/presentation/pages/cart_page.dart';
import '../../src/home/presentation/pages/home_page.dart';
import '../../src/main_index.dart';
import '../../src/nav_bar/presentation/pages/main_navgation_bar.dart';
import '../../src/products/presentation/details/pages/product_details_page.dart';
import '../../src/products/presentation/view/pages/products_page.dart';
import '../../src/profile/presentation/changePhone/pages/change_mobile_number_page.dart';
import '../../src/profile/presentation/changePhone/pages/change_phone_verify_otp_page.dart';
import '../../src/profile/presentation/pages/profile_page.dart';
import '../../src/settings/presentation/pages/change-language/chang_language_page.dart';
 import '../../src/settings/presentation/pages/change_password/change_password_page.dart';
import '../../src/settings/presentation/pages/change_password/change_password_send_otp_page.dart';
import '../../src/settings/presentation/pages/change_password/change_password_verify_otp_page.dart';
import '../../src/splash/presentation/pages/splash_screen.dart';

class Routes {

  static const String productsPage = 'productsPage';
  static const String productDetailsPage = 'productDetailsPage';
  static const String cartPage = 'cartPage';

  static const String intro = '/';
  static const String onBoardingPage = 'onBoardingPage';
  static const String loginPage = 'loginUI';

  static const String register = 'registerPage';
  static const String favoritesPage = 'favoritesPage';
  static const String changePasswordPage = 'ChangePasswordPage';
  static const String changLanguagePage = 'ChangLanguagePage';
  static const String enterPhoneNumberPage = 'enterPhoneNumberPage';
  static const String enterPinCodePage = 'enterPinCodePage';
  static const String changeMobileNumberPage = 'ChangeMobileNumberPage';


  static const String newPasswordPage = 'newPasswordPage';
  static const String navigationPages = 'navigationPages';
  static const String notifications = 'notifications';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String aboutPage = 'aboutLogestePage';
  static const String contactUsPage = 'contactUsPage';
  static const String homePage = 'homePage';
  static const String forgotPasswordPage = 'forgotPasswordPage';
  static const String splashPage = 'splashPage';
  static const String addRequestPage = 'addRequestPage';
  static const String languagePage = 'languagePage';
  static const String changePasswordSendOtpPage = 'changePasswordSendOtpPage';
  static const String changePasswordVerifyOtpPage = 'changePasswordVerifyOtpPage';
  static const String changePhoneVerifyOtpPage = 'changePhoneVerifyOtpPage';


  /* ====================================================================== */

  static final routes = <String, Widget Function(BuildContext)>{
    splashPage: (context) => SplashPage(),
    productsPage: (context) => ProductsPage(),
    productDetailsPage: (context) => ProductDetailsPage(),
    cartPage: (context) => CartPage(),
    enterPhoneNumberPage: (context) => EnterPhoneNumberPage(),
      loginPage: (context) => LoginPage(),
    notifications: (context) => ProductsPage(),
    forgotPasswordPage: (context) => ForgotPasswordPage(),
    changePasswordPage: (context) => ChangePasswordPage(),
    enterPinCodePage: (context) => EnterPinCodePage(),
    navigationPages: (context) => NavigationBarPage(),
    homePage: (context) => HomePage(),
    profile: (context) => ProfilePage(),
    changLanguagePage: (context) => ChangeLanguagePage(),
    languagePage: (context) => ChangeLanguagePage(),
    changeMobileNumberPage: (context) => ChangeMobileNumberPage(),
    changePasswordSendOtpPage: (context) => ChangePasswordSendOtpPage(),
    changePasswordVerifyOtpPage: (context) => ChangePasswordVerifyOtpPage(),
    changePhoneVerifyOtpPage: (context) => ChangePhoneVerifyOtpPage(),
  };
}
