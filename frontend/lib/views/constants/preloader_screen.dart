// ignore_for_file: library_private_types_in_public_api

import 'package:sales_force_app/views/admin/dashboard/super_admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/auth_controller.dart';
import 'package:sales_force_app/views/login/login_screen.dart';

class PreloaderScreen extends StatefulWidget {
  @override
  _PreloaderScreenState createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  final AuthController authController = Get.put(AuthController());
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Add a small delay to show the preloader
    await Future.delayed(Duration(milliseconds: 1500));

    if (_isRedirecting) return;
    _isRedirecting = true;

    // Check authentication status
    final isLoggedIn = await authController.checkAuthStatus();

    if (isLoggedIn) {
      Get.offAll(() => SuperAdminDashboard());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4D48B4),
              Color(0xFF2023ED),
              Color(0xFF1700E6),
              Color(0xFF0047ED),
              Color(0xFF745CFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people_alt_rounded,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 24),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4,
              ),
              SizedBox(height: 20),
              Text(
                'SalesForce CRM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _isRedirecting = false;
    super.dispose();
  }
}
