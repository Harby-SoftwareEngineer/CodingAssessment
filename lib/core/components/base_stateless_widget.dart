
import '../widgets/dialogs/progress_dialog.dart';
import '/src/main_index.dart';
abstract class BaseStatelessWidget extends StatelessWidget {

  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;
  final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings ;
  ThemeData get theme => Theme.of(context!);
  TextTheme get textTheme => theme.textTheme;
  final local = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();

  TextStyle get whiteRegularStyle => textTheme.labelSmall!;
  TextStyle get whiteMediumStyle => textTheme.labelMedium!;
  TextStyle get whiteSemiBoldStyle => textTheme.labelLarge!;
  TextStyle get whiteBoldStyle => textTheme.titleLarge!.copyWith(color: whiteSemiBoldStyle.color);
  TextStyle get hintRegularStyle => textTheme.displaySmall!;
  TextStyle get hintMediumStyle => textTheme.displayMedium!;
  TextStyle get hintBoldStyle => textTheme.titleLarge!.copyWith(color: hintMediumStyle.color);
  TextStyle get hintSemiBoldStyle => textTheme.displayLarge!;
  TextStyle get primaryRegularStyle => textTheme.headlineSmall!;
  TextStyle get primaryMediumStyle => textTheme.headlineMedium!;
  TextStyle get primarySemiBoldStyle => textTheme.headlineLarge!;
  TextStyle get primaryBoldStyle => textTheme.titleLarge!.copyWith(color: primaryMediumStyle.color, fontSize: 18);
  TextStyle get blackRegularStyle => textTheme.bodySmall!;
  TextStyle get blackMediumStyle => textTheme.bodyMedium!;
  TextStyle get blackSemiBoldStyle => textTheme.bodyLarge!;
  TextStyle get blackBoldStyle => textTheme.titleLarge!;


  Color get errorColor => theme.colorScheme.error;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get dividerColor => theme.dividerColor;
  //primary
  Color get primaryColor => theme.primaryColor;
  Color get kOrange => theme.iconTheme.color!;
  Color get hintColor => theme.hintColor;
  Color get primaryContainer => theme.colorScheme.primaryContainer;
  Color get secondaryContainer => theme.colorScheme.secondaryContainer;
  Color get primaryColorDark => theme.primaryColorDark;
  //white
  Color get cardColor => theme.cardColor;

  Color get orangeColor => AppColors.orangeColor;
  Color get blueColorOff => AppColors.blueColorff;
  Color get greyColor => AppColors.greyColor;
  Color get orangeLight => AppColors.orangeLight;
  Color get greyColorB1 => AppColors.greyColorAC;
  Color get onPrimary => theme.colorScheme.onPrimary;
  Color get whiteTextColor => whiteRegularStyle.color!;
  Color get blackTextColor => blackRegularStyle.color!;
  EdgeInsetsGeometry get basePadding => const EdgeInsets.all(12);
  EdgeInsetsGeometry get basePaddingItem => 12.paddingAll - 10.paddingBottom;
  //static String routeName (){return '';}

  final CustomProgressDialog progress =
      DialogsManager.createProgress();

  bool isRtl() => local == 'ar';

  BaseStatelessWidget({Key? key}):  super(key: key);


  T? getArguments<T>(BuildContext context ){
    return context.getArguments();
  }

   handleErrorDialogBuilder(dynamic exception) {
    final context = this.context ;

    DialogsManager. showErrorDialog(context!, exception);

   }

}
