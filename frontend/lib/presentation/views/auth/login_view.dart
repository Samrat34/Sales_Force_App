import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cms_system/presentation/controllers/auth_controller.dart';
import 'package:cms_system/presentation/views/auth/widgets/background_bubbles.dart';
import 'package:cms_system/presentation/views/auth/widgets/logo_section.dart';
import 'package:cms_system/presentation/views/auth/widgets/login_form.dart';
import 'package:cms_system/presentation/views/auth/widgets/role_selection.dart';
import 'package:cms_system/presentation/views/auth/widgets/footer_section.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Stack(
            children: [
              // Animated background bubbles
              const BackgroundBubbles(),

              // Main content
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),

                      // Logo and title
                      const LogoSection(),

                      SizedBox(height: 40.h),

                      // Login form and role selection
                      const LoginContent(),

                      SizedBox(height: 40.h),

                      // Footer
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Form section
          const LoginForm(),

          SizedBox(height: 32.h),

          // Role selection section
          const RoleSelection(),
        ],
      ),
    );
  }
}
