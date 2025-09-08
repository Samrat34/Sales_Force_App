import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/presentation/splash/splash_screen.dart';
import '../views/login/login_screen.dart';

// Define your route names as constants
class RouteNames {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  // Add more route names as needed
}

class AppRoutes {
  // Generate route based on settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return GetPageRoute(
          page: () => SplashScreen(), // Add the required page parameter
          settings: settings,
        );
      case RouteNames.login:
        return GetPageRoute(
          page: () => LoginScreen(), // Add the required page parameter
          settings: settings,
        );
      // Add more routes as needed
      default:
        // Handle unknown routes
        return GetPageRoute(
          page: () => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          settings: settings,
        );
    }
  }

  // Alternative: Using GetX's built-in routing (recommended)
  static final List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashScreen(), // Required page parameter
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginScreen(), // Required page parameter
    ),
    // Add more pages here
  ];
}
