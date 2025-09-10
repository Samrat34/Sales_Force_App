import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/auth_controller.dart';

class EmailField extends GetView<AuthController> {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0c4a6e), // blue-900
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: const Color(0xFFbae6fd), // light blue-200
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: const Color(0xFF0c4a6e), // blue-900
            ),
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFF7dd3fc), // light blue-300
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.w),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF38bdf8), // light blue-400
                  size: 20,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16.h),
            ),
          ),
        ),
      ],
    );
  }
}
