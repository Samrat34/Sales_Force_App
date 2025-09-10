import 'package:get/get.dart';
import 'package:cms_system/presentation/views/auth/login_view.dart';
import 'package:cms_system/presentation/views/dashboard/dashboard_view.dart';
import 'package:cms_system/presentation/bindings/auth_binding.dart';
import 'package:cms_system/presentation/bindings/dashboard_binding.dart';
import 'package:cms_system/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];

  // Helper method to check if a route is registered
  static bool isRouteRegistered(String routeName) {
    return pages.any((page) => page.name == routeName);
  }
}
