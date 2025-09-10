import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cms_system/services/navigation_service.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final NavigationService navigationService = Get.find<NavigationService>();

  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() async {
    try {
      Get.log("Login button pressed");

      // Check if formKey is initialized
      if (formKey.currentState == null) {
        Get.log("Form key current state is null");
        Get.snackbar(
          'Error',
          'Form not initialized properly',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      if (formKey.currentState!.validate()) {
        Get.log("Form validation passed");
        isLoading(true);

        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));

        isLoading(false);

        Get.log("Attempting to navigate to dashboard");

        // Use the navigation service
        await navigationService.navigateToDashboard();
      } else {
        Get.log("Form validation failed");
      }
    } catch (e) {
      Get.log("Error during login: $e");
      isLoading(false);
      Get.snackbar(
        'Error',
        'An error occurred during login: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
