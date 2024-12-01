import 'package:app/core/di/injector.dart';

class Validation {
  //"^5(\\d{8})\$"
  static bool isValidPhone(String phone) =>
      RegExp("^(5|05)(\\d{8})\$").hasMatch(phone);

  static bool isArabicLetters(String name) =>
      RegExp("^[\u0621-\u064A\\s]+\$").hasMatch(name);

  static bool isValidFullName(String name) =>
      RegExp("^[\u0621-\u064a\\s]{3,}(?: [\u0621-\u064a\\s]+){2}\$")
          .hasMatch(name);

  static bool isValidIDNumber(String id) =>
      RegExp("^[1-2][0-9]{1,10}\$").hasMatch(id);

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static String? validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  static String? validateRequired(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    return null;
  }

  static String? validatePhone(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    if (value.length < 11) {
      return strings.phone_number_must_be_at_least_11_characters;
    }
    return null;
  }

  static String? validatePassword(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    if (value.length < 8) {
      return strings.password_must_be_at_least_8_characters;
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    if (value != password) {
      return strings.passwords_do_not_match;
    }
    return null;
  }
}
