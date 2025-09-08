import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_theme.dart';
import 'core/routes.dart' as routes;
import 'domain/view_models/auth_viewmodel.dart'; // Add this import

void main() {
  // Add this line to initialize AuthViewModel
  Get.put(AuthViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SalesForce CRM',
      theme: appTheme,
      initialRoute: routes.RouteNames.splash,
      getPages: routes.AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
