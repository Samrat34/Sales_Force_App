import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cms_system/routes/app_routes.dart';
import 'package:cms_system/routes/app_pages.dart';

class NavigationService extends GetxService {
  static NavigationService get to => Get.find();

  Future<void> navigateToDashboard() async {
    try {
      if (AppPages.isRouteRegistered(AppRoutes.DASHBOARD)) {
        // Using log instead of debugPrint for production code
        Get.log("Navigating to dashboard");
        await Get.offAllNamed(AppRoutes.DASHBOARD);
      } else {
        Get.log("Dashboard route not found");
        Get.snackbar(
          'Error',
          'Dashboard route not found',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.log("Error navigating to dashboard: $e");
      Get.snackbar(
        'Error',
        'Failed to navigate to dashboard',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
