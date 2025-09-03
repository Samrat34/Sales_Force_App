import 'package:sales_force_app/database/database_helper.dart';
import 'package:sales_force_app/views/customer/customer_dashboard.dart';
import 'package:sales_force_app/views/employee/employee_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/models/user_model.dart';
import 'package:sales_force_app/views/admin/dashboard/super_admin_dashboard.dart';

class LoginController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var isLoading = false.obs;
  var currentUser = Rxn<User>();

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      // Verify user credentials
      final User? user = await _databaseHelper.verifyUser(email, password);

      if (user != null) {
        currentUser.value = user;

        // Navigate based on user role
        switch (user.role) {
          case 'super_admin':
            Get.offAll(() => SuperAdminDashboard());
            break;
          case 'client':
            Get.offAll(() =>
                SuperAdminDashboard()); // Redirect to admin dashboard for client
            break;
          case 'employee':
            Get.offAll(() => EmployeeDashboard());
            break;
          case 'customer':
            Get.offAll(() => CustomerDashboard());
            break;
          default:
            Get.offAll(() => CustomerDashboard());
        }

        Get.snackbar(
          'Success',
          'Welcome back, ${user.name}!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  bool get isLoggedIn => currentUser.value != null;
  User? get user => currentUser.value;
  String get userRole => currentUser.value?.role ?? '';
}
