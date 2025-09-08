// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/views/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/user_role.dart';

class AuthViewModel extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  String email = '';
  String password = '';

  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;

  Future<void> loginWithRole(UserRole role) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      print('🚀 STARTING loginWithRole: ${role.name}');

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock login logic with specific role
      currentUser.value = UserModel(
        id: '1',
        email: email.isNotEmpty
            ? email
            : '${role.name.toLowerCase().replaceAll(' ', '')}@example.com',
        name: '${role.name} User',
        role: role,
        createdAt: DateTime.now(),
        isActive: true,
      );

      print('✅ USER CREATED: ${currentUser.value?.name}');

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', currentUser.value!.toMap().toString());
      print('💾 USER SAVED TO SHARED PREFERENCES');

      errorMessage.value = 'Login successful! Redirecting...';

      // CRITICAL: Add a small delay to ensure UI updates complete
      await Future.delayed(const Duration(milliseconds: 100));

      print('🔄 ATTEMPTING NAVIGATION TO DASHBOARD...');

      // METHOD 1: Direct widget navigation (most reliable)
      Get.offAll(() => const DashboardScreen());

      print('🎉 NAVIGATION COMMAND SENT');
    } catch (e) {
      print('❌ LOGIN ERROR: $e');
      errorMessage.value = 'Error: $e';

      // Show error dialog
      Get.defaultDialog(
        title: 'Navigation Error',
        content: Text('Could not navigate to dashboard: $e'),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (email.isNotEmpty && password.isNotEmpty) {
        // Determine role based on email (for demo purposes)
        UserRole role;
        if (email.contains('admin')) {
          role = UserRole.superAdmin;
        } else if (email.contains('employee')) {
          role = UserRole.adminEmployee;
        } else if (email.contains('client')) {
          role = UserRole.client;
        } else if (email.contains('customer')) {
          role = UserRole.customer;
        } else {
          role = UserRole.customer; // Default role
        }

        currentUser.value = UserModel(
          id: '1',
          email: email,
          name: 'User Name',
          role: role,
          createdAt: DateTime.now(),
          isActive: true,
        );

        // Save to shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', currentUser.value!.toMap().toString());

        errorMessage.value = 'Login successful! Redirecting...';
        Get.offAll(() => const DashboardScreen());
      } else {
        throw Exception('Please enter valid credentials');
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      // Parse user data and set currentUser
      // For simplicity, we'll just redirect
      Get.offAll(() => const DashboardScreen());
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  // Add this getter for easy role access
  UserRole? get userRole => currentUser.value?.role;
}
