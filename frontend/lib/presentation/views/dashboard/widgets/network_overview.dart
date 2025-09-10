import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/dashboard_controller.dart';

class NetworkOverview extends GetView<DashboardController> {
  const NetworkOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Icon(Icons.network_ping, color: Colors.purple[600]!, size: 18.w),
              SizedBox(width: 8.w),
              Text(
                'Network Overview',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]!,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => _buildNetworkItem(
                  title: 'Company Staff',
                  value: controller.networkOverview['companyStaff'].toString(),
                  color: Colors.blue,
                ),
              ),
              Obx(
                () => _buildNetworkItem(
                  title: 'Field Staff',
                  value: controller.networkOverview['fieldStaff'].toString(),
                  color: Colors.purple,
                ),
              ),
              Obx(
                () => _buildNetworkItem(
                  title: 'Active Outlets',
                  value: controller.networkOverview['activeOutlets'].toString(),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkItem({
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          title,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]!),
        ),
      ],
    );
  }
}
