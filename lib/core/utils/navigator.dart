import 'package:app/src/main_index.dart';

Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
  BuildContext context = injector<ServicesLocator>().appContext;
  print('routeName: $routeName');
  return injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pushNamed(routeName, arguments: arguments);
}

Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) {
  BuildContext context = injector<ServicesLocator>().appContext;
  print('routeName: $routeName');
  return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName, (Route<dynamic> route) => false,
      arguments: arguments);
}

Future<dynamic> push(Widget page) {
  BuildContext context = injector<ServicesLocator>().appContext;
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => page));
}

pop({dynamic arguments}) {
  injector<ServicesLocator>().navigatorKey.currentState!.pop(arguments);
}

pushNameByUri(Uri uri) {
  return injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pushNamed(uri.path, arguments: uri.queryParameters);
}

pushReplacementNamed(String routeName, {dynamic arguments}) {
    return injector<ServicesLocator>()
        .navigatorKey
        .currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
}
