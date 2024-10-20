import 'package:aero_drought/pages/results_page.dart';
import 'package:aero_drought/pages/splash_screen.dart';

import '../main.dart';
import '../pages/recomendations_page.dart';
import '/pages/home_page.dart';
import '/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static String splash = "/";
  static String index = "/info";
  static String home = "/home";
  static String results = "/results";
  static String recommendation = "/welcome";

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      splash: (context) => const SplashScreen(),
      index: (context) => const WelcomePage(),
      home: (context) => const HomePage(),
      // results: (context) => const ResultsPage(),
      recommendation: (context) => const RecommendationsPage(),
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
