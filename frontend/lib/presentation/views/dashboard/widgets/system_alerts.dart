import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/dashboard_controller.dart';

class SystemAlerts extends GetView<DashboardController> {
  const SystemAlerts({super.key});

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
              Icon(Icons.warning_amber, color: Colors.orange[600]!, size: 18.w),
              SizedBox(width: 8.w),
              Text(
                'System Alerts',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]!,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Alerts List
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.alerts.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                final alert = controller.alerts[index];
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[50]!,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Indicator
                      Container(
                        width: 6.w,
                        height: 6.w,
                        margin: EdgeInsets.only(top: 4.h),
                        decoration: BoxDecoration(
                          color: alert.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w),

                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alert.title,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]!,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              alert.message,
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.grey[600]!,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              alert.time,
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.grey[500]!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
