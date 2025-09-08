import 'package:get/get.dart';
import 'package:sales_force_app/presentation/splash/splash_screen.dart';
import 'package:sales_force_app/views/dashboard/dashboard_screen.dart';
import 'package:sales_force_app/views/login/login_screen.dart';

class TestRouteNames {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

class TestRoutes {
  static final pages = [
    GetPage(name: TestRouteNames.splash, page: () => SplashScreen()),
    GetPage(name: TestRouteNames.login, page: () => LoginScreen()),
    GetPage(
      name: TestRouteNames.dashboard,
      page: () => const DashboardScreen(),
    ),
  ];
}
