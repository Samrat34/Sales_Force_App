import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 96.w,
              height: 96.w,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF38bdf8), // light blue-400
                    Color(0xFF22d3ee), // cyan-400
                    Color(0xFF06b6d4), // cyan-500
                  ],
                ),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(Icons.security, color: Colors.white, size: 48),
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: Colors.amber.shade400,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.workspace_premium,
                  color: Color(0xFF78350f), // yellow-800
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Text(
          'SalesForce CRM',
          style: GoogleFonts.poppins(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [
                  Color(0xFF0369a1), // blue-700
                  Color(0xFF0891b2), // cyan-600
                  Color(0xFF0e7490), // teal-600
                ],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Multi-tier Access Portal',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            color: const Color(0xFF0c4a6e), // blue-900
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Choose your role and access your dashboard',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: const Color(0xFF075985), // blue-800
          ),
        ),
      ],
    );
  }
}
