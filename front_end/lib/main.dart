// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/(data/models/test_routes.dart' as test_routes;
import 'core/app_theme.dart';
import 'domain/view_models/auth_viewmodel.dart';

void main() {
  // Initialize GetX dependencies
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
      initialRoute: test_routes.TestRouteNames.splash,
      getPages: test_routes.TestRoutes.pages,
      debugShowCheckedModeBanner: false,
      // Add routing callback for debugging
      routingCallback: (routing) {
        print('📱 Routing callback: ${routing?.current}');
      },
    );
  }
}
