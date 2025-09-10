import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: const Color(0xFFbae6fd), // light blue-200
          thickness: 1,
        ),
        SizedBox(height: 16.h),
        Text(
          'SalesForce CRM v3.0.0 - Enterprise Edition',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF0c4a6e), // blue-900
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '© 2024 SalesForce Solutions • Secure Multi-Tenant Platform',
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            color: const Color(0xFF075985), // blue-800
          ),
        ),
      ],
    );
  }
}
