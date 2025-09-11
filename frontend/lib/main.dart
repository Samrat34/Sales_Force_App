import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cms_system/core/themes/app_theme.dart';
import 'package:cms_system/routes/app_pages.dart';
import 'package:cms_system/routes/app_routes.dart';
import 'package:cms_system/services/navigation_service.dart';

// handover/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'SalesForce CRM',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutes.INITIAL,
          getPages: AppPages.pages,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          initialBinding: InitialBinding(),
        );
      },
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationService());
  }
}
