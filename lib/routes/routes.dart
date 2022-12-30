import 'package:flutter/material.dart';
import 'package:list/screens/icon_page.dart';
import 'package:list/screens/list_page.dart';

class AppRouter {
  const AppRouter._();

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    //final Object? argument = settings.arguments;

    switch (settings.name) {
      case ListPage.routeName:
        builder = (_) => const ListPage();
        break;
       case IconPage.routeName:
        builder = (_) => IconPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
