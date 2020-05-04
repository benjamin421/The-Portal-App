import 'package:fiber/UI/View/SplashScreen.dart';
import 'package:fiber/UI/TabBar/RootTabBar.dart';
import 'package:flutter/material.dart';

const String initialRoute = "/";

const String refreshRoute = "refresh";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => RootTabBar());
      case 'refresh':
        return MaterialPageRoute(builder: (_) => RootTabBar());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
