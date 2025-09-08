import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_theme.dart';
import 'core/routes.dart' as routes; // Import your routes

void main() {
  runApp(MyApp());
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
