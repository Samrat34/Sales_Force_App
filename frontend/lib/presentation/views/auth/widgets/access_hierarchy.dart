import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccessHierarchy extends StatelessWidget {
  const AccessHierarchy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFe0f2fe), // light blue-100
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFbae6fd), // light blue-200
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.security,
                color: Color(0xFF0369a1), // blue-700
                size: 16,
              ),
              SizedBox(width: 8.w),
              Text(
                'Access Hierarchy',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0c4a6e), // blue-900
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildHierarchyItem('Super Admin: Full system control'),
          _buildHierarchyItem('Company Employee: Under Super Admin'),
          _buildHierarchyItem('Client: Independent business access'),
          _buildHierarchyItem('Client Employee: Under specific client'),
          _buildHierarchyItem('Customer: Service consumer access'),
        ],
      ),
    );
  }

  Widget _buildHierarchyItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        '• $text',
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: const Color(0xFF075985), // blue-800
        ),
      ),
    );
  }
}
