import '../main.dart';
import '/pages/home_page.dart';
import '/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static String index = "/";
  static String home = "/home";

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      index: (context) => const WelcomePage(),
      home: (context) => const HomePage(),
    };
  }

  static String getRoute(String route) {
    return routes[route]?.toString() ?? '';
  }

  static void go(String route) {
    Navigator.of(context!).push(
      MaterialPageRoute(
        builder: (context) => routes[route]!(context),
      ),
    );
  }
}
