import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/action_card.dart';

class AdministrativeActions extends StatelessWidget {
  const AdministrativeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Administrative Actions',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800]!,
          ),
        ),
        SizedBox(height: 12.h),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.1,
          children: const [
            ActionCard(
              title: 'Admin Panel',
              subtitle: 'Manage users, permissions & settings',
              icon: Icons.settings,
              iconGradient: [
                Color(0xFF4B5563),
                Color(0xFF1F2937),
              ], // gray-600 to gray-800
            ),
            ActionCard(
              title: 'User Permissions',
              subtitle: 'Control access & permission management',
              icon: Icons.security,
              iconGradient: [
                Color(0xFF9333EA),
                Color(0xFF4338CA),
              ], // purple-600 to indigo-700
            ),
            ActionCard(
              title: 'System Reports',
              subtitle: 'Enterprise performance analytics',
              icon: Icons.bar_chart,
              iconGradient: [
                Color(0xFF059669),
                Color(0xFF065F46),
              ], // green-600 to teal-700
            ),
            ActionCard(
              title: 'Security Center',
              subtitle: 'Monitor system security & compliance',
              icon: Icons.shield,
              iconGradient: [
                Color(0xFFDC2626),
                Color(0xFFB91C1C),
              ], // red-600 to pink-700
            ),
          ],
        ),
      ],
    );
  }
}
