import 'dart:convert';
import 'dart:io';
import 'package:app/core/exceptions/extensions.dart';
import 'package:app/core/routes/routes.dart';
import 'package:app/core/utils/helper_methods.dart';
import 'package:app/core/utils/navigator.dart';
import 'package:app/src/main_index.dart';
import 'package:dio/dio.dart';
import '../../src/auth/presentation/pages/login/login_page.dart';
import '../di/injector.dart';
import '../exceptions/api_exception.dart';

class ClientCreator {
  final Interceptor? interceptor;

  ClientCreator({this.interceptor});

  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    // dio2.options.connectTimeout(Duration(seconds: 60).inMilliseconds));
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final keyAuthorization = "Authorization";
  final keyLanguage = "Accept-Language";
  final keyCountry = "Accept-Country";
  final keyType = "Content-Type";
  final keyAccept = "Accept";
  final keyVersion = "version";

  final String accessToken;

  HeaderInterceptor({required this.accessToken});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // String token = await HelperMethods.getToken();
    // options.headers[keyAuthorization] = 'Bearer $token';
    options.headers[keyType] = 'application/json';
    // options.headers[keyAccept] = 'application/json';
    // options.headers[keyLanguage] = injector<ServicesLocator>().languageCode;
    //
    print('options.headers => ${options.headers}');
    print('options.queryParameters => ${options.queryParameters}');
    print('options.data => ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'DIO ERROR onError ${err.response != null} =>error message is  ${err.error}');

    if (err.response != null) {
      Map<String, dynamic> data = json.decode(err.response.toString());
      String message = data.containsKey('status') ? data['message']['detailedResponseCode'] : "Error";
      // final status = data.containsKey('status') ? data['status'] : "Error";
      int code = data.containsKey('code') ? data['code'] : 0;
      if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
        // HelperMethods.clearCashData();
        // pushReplacementNamed(Routes.loginPage);
      }
      /*throw DioError(
        error: message,
        response: err.response,
        type: DioErrorType.response,
        requestOptions: err.requestOptions,
      );*/
      throw ApiException(message, code);
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    // Map<String, dynamic> data = response.data;
    // final message = data.containsKey('message') ? data['message'] : "Error";
    // // final status = data.containsKey('status') ? data['status'] : "Error";
    // String code =
    //     data.containsKey('code') ? response.data['code'].toString() : "E";
    // print('onRespons ${response.toString()} => ${code != 'Ok'}');
    // if (status != SUCCESS_CODE) {
    //   throw ApiException(message, code);
    // }
  }
}
