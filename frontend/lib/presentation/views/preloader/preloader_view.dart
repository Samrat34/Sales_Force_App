import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cms_system/routes/app_routes.dart';

class PreloaderView extends StatefulWidget {
  const PreloaderView({super.key});

  @override
  State<PreloaderView> createState() => _PreloaderViewState();
}

class _PreloaderViewState extends State<PreloaderView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    Get.log("Preloader initialized, current route: ${Get.currentRoute}");

    // Ensure the widget is fully initialized before navigating
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Get.log("Navigating to login screen");
      Get.offAllNamed(AppRoutes.LOGIN);
      Get.log("Navigation to login executed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFe0f2fe), // light blue-100
              Color(0xFFbae6fd), // light blue-200
              Color(0xFF7dd3fc), // light blue-300
              Color(0xFF38bdf8), // light blue-400
              Color(0xFF22d3ee), // cyan-400
              Color(0xFF06b6d4), // cyan-500
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF38bdf8), // light blue-400
                      Color(0xFF22d3ee), // cyan-400
                      Color(0xFF06b6d4), // cyan-500
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.business,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'SalesForce CRM',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0c4a6e), // blue-900
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'CRM System',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF075985), // blue-800
                ),
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF06b6d4),
                ), // cyan-500
              ),
            ],
          ),
        ),
      ),
    );
  }
}
