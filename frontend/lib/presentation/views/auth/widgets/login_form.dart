import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cms_system/presentation/controllers/auth_controller.dart';
import 'package:cms_system/presentation/views/auth/widgets/email_field.dart';
import 'package:cms_system/presentation/views/auth/widgets/password_field.dart';
import 'package:cms_system/presentation/views/auth/widgets/sign_in_button.dart';

class LoginForm extends GetView<AuthController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0c4a6e), // blue-900
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Enter your credentials to continue',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF075985), // blue-800
            ),
          ),
          SizedBox(height: 24.h),

          // Email field
          const EmailField(),

          SizedBox(height: 16.h),

          // Password field
          const PasswordField(),

          SizedBox(height: 24.h),

          // Sign in button
          const SignInButton(),
        ],
      ),
    );
  }
}
