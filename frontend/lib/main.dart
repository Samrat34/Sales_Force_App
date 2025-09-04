import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/user_controller.dart';
import 'package:sales_force_app/views/constants/app_bindings.dart';
import 'package:sales_force_app/views/constants/preloader_screen.dart';
import 'package:sales_force_app/views/admin/dashboard/super_admin_dashboard.dart';
import 'package:sales_force_app/views/outlets/outlets_screen.dart';

void main() {
  // Initialize controllers here
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SalesForce CRM',
      initialRoute: '/',
      initialBinding: AppBinding(), // 👈 ensure bindings are loaded
      getPages: [
        GetPage(name: '/', page: () => PreloaderScreen()),
        GetPage(
            name: '/superadmin-dashboard', page: () => SuperAdminDashboard()),
        GetPage(name: '/outlets', page: () => OutletScreen()),
      ],
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}
