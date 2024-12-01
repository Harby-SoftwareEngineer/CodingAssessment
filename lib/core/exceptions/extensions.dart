import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../src/main_index.dart';
import 'api_exception.dart';
import 'empty_list_exception.dart';

extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }

  T? getArguments<T>(){
    return ModalRoute.of(this)?.settings.arguments as T?;
  }

  String handleApiErrorMessage({required dynamic exception}) {
    final strings = getStrings();
    String message = strings.something_went_wrong;
    String messageWrong = message;
    String code = "0";
    print('handleApiError is dio   ${exception is DioException}');
    if (exception is DioException) {

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = messageWrong;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = message;
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        print('handleApiError whenApiException is dio   $message');

      }
    }

    if (exception is ApiException) {
      message = exception.message;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    // if (exception is DioException && exception.response?.data != null) {
    //   message = exception.response?.data['message']['message'];
    // }
    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = injector<ServicesLocator>().appContext.strings.something_went_wrong;
    int code = 0;
    List<String> errors = [];
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code ;
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    print('handleApiError message $message');
    return ApiException(message ,code);
  }


}

extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty ;
  }
}



extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get shadowColor => Theme.of(this).shadowColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get outline => Theme.of(this).colorScheme.outline;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get whiteBoldStyle => textTheme.titleLarge!.copyWith(color: textTheme.labelLarge!.color);
}


extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String get countryCode => locale.countryCode!;

  String get ar => 'ar';
  String get en => 'en';
}

extension AppLocalizationsShortcuts on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}


extension PaddingExtension on num {

  EdgeInsetsDirectional get paddingAll => EdgeInsetsDirectional.all(toDouble());

  EdgeInsetsDirectional get paddingVert => EdgeInsetsDirectional.symmetric(vertical: toDouble());

  EdgeInsetsDirectional get paddingHoriz => EdgeInsetsDirectional.symmetric(horizontal: toDouble());

  EdgeInsetsDirectional get paddingStart => EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsDirectional get paddingEnd => EdgeInsetsDirectional.only(end: toDouble());

  EdgeInsetsDirectional get paddingTop => EdgeInsetsDirectional.only(top: toDouble());

  EdgeInsetsDirectional get paddingBottom => EdgeInsetsDirectional.only(bottom: toDouble());
}

extension EmptyPaadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get phShrink => const SizedBox.shrink();
}

extension SizeExtension on BuildContext {
  BuildContext get context => injector<ServicesLocator>().appContext;
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

}

extension FirstWhereOrNullExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}



extension WidgetPaadding on Widget {
  Widget paddingAll(int space) =>
      Padding(padding: space.paddingAll, child: this);

  Widget paddingVert(int space) =>
      Padding(padding: space.paddingVert, child: this);

  Widget paddingHoriz(int space) =>
      Padding(padding: space.paddingHoriz, child: this);

  Widget paddingStart(int space) =>
      Padding(padding: space.paddingStart, child: this);

  Widget paddingEnd(int space) =>
      Padding(padding: space.paddingEnd, child: this);

  Widget paddingTop(int space) =>
      Padding(padding: space.paddingTop, child: this);

  Widget paddingBottom(int space) =>
      Padding(padding: space.paddingBottom, child: this);

  Widget paddingOnly({
    int? top,
    int? bottom,
    int? start,
    int? end,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.only(
          top: top?.toDouble() ?? 0,
          bottom: bottom?.toDouble() ?? 0,
          start: start?.toDouble() ?? 0,
          end: end?.toDouble() ?? 0,
        ),
        child: this,
      );
}

extension AlignExtension on Widget {
  Widget center() => Center(child: this);
  Widget align(AlignmentGeometry alignment) => Align(alignment: alignment, child: this);
  Widget alignCenterStart() => Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget alignCenterEnd() => Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget alignCenter() => Align(alignment: AlignmentDirectional.center, child: this);
  Widget alignTopStart() => Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget alignTopEnd() => Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget alignTopCenter() => Align(alignment: AlignmentDirectional.topCenter, child: this);
  Widget alignBottomStart() => Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget alignBottomEnd() => Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget alignBottomCenter() => Align(alignment: AlignmentDirectional.bottomCenter, child: this);
}