import 'package:app/core/di/injector.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static String DATE_FORMAT = 'dd-MM-yyyy';
  static String DATE_FORMAT_MOUNTH = 'MMMM yyyy';
  static String DATE_FORMAT_MOUNTH_DAY = 'EEEE, d MMM, yyyy';
  static const MONTH_NAME_YEAR ='MMM yyyy ' ;
  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 0) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (diff.inHours > 0) {
      return '${date.hour}:${date.minute}';
    } else {
      return '${date.hour}:${date.minute}';
    }
  }
  static String monthNameYear(DateTime date){
    return formatDateV2(date, 'MMM yyyy ');
  }

  static String formatToTime(String date) {
    DateTime dateTime = DateFormat('yyyy-MM-ddThh:mm:ss').parse(date);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }


  static String formatDateV2(DateTime dateTime ,String pattern , ){

    try {
      return DateFormat(pattern).format(dateTime);
    }catch(e){
      return '' ;
    }
  }



  static String formatChatDate(String dateChat){
    try {
      final date = DateTime.parse(dateChat);
      final now = DateTime.now();
      final diff = now.difference(DateTime.parse(date.toString()));
      if (diff.inDays > 0) {
        return '${date.day}/${date.month}/${date.year}';
      } else if (diff.inHours > 0) {
        final formattedTime = DateFormat.jm().format(date);
        return formattedTime;
      } else {
        final formattedTime = DateFormat.jm().format(date);
        return formattedTime;
      }
    } on Exception catch (e) {
      return '';
    }
  }
// convert from date string 20-8-2024 to 20 oct 2024
  static String formatOrderStatusDateString(String dateString){
    try {
      final DateFormat _inputFormat = DateFormat('dd-MM-yyyy');
      final DateFormat _outputFormat = DateFormat('dd\nMMM');
      DateTime date = _inputFormat.parse(dateString);
      String formattedDate = _outputFormat.format(date);
      return formattedDate;
    } on Exception catch (e) {
      return '';
    }
  }

  static String formatString(String dateString, {String format = 'd MMM yyyy'}){
    final lang = injector<ServicesLocator>().languageCode;
    try {
      print('formatTimestampString dateString: $dateString');
      final DateFormat _inputFormat = DateFormat('yy-MM-dd');
      final DateFormat _outputFormat = DateFormat(format, lang);
      DateTime date = _inputFormat.parse(dateString);
      String formattedDate = _outputFormat.format(date );
      return formattedDate;
    } catch (e) {
      print('formatTimestampString error: $e');
      return dateString;
    }
  }

  static String formatTimestampString(String dateString, {String format = 'dd-MM-yyyy'}){
    // final lang = injector<ServicesLocator>().languageCode;
    try {
      print('formatTimestampString dateString: $dateString');
      final DateFormat _inputFormat = DateFormat('yy-MM-dd');
      final DateFormat _outputFormat = DateFormat(format);
      DateTime date = _inputFormat.parse(dateString);
      String formattedDate = _outputFormat.format(date );
      return formattedDate;
    } on Exception catch (e) {
      print('formatTimestampString error: $e');
      return dateString;
    }
  }
}