import 'package:sales_force_app/views/constants/app_bindings.dart';
import 'package:sales_force_app/views/outlets/outlets_screen.dart';
import 'package:sales_force_app/views/constants/preloader_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'SalesForce CRM',
      initialBinding:
          AppBinding(), // Add this line to register your controllers
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => PreloaderScreen()),
        GetPage(
          name: '/outlets',
          page: () => OutletScreen(),
          // Optional: You can also add binding here if you want route-specific binding
          // binding: BindingsBuilder(() {
          //   Get.lazyPut<OutletController>(() => OutletController());
          // }),
        ),
      ],
      // Fallback for unknown routes
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    );
  }
}
