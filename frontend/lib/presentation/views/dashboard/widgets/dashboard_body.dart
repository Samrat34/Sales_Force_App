import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cms_system/presentation/controllers/dashboard_controller.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/executive_dashboard_card.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/stats_grid.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/administrative_actions.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/network_overview.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/system_alerts.dart';

class DashboardBody extends GetView<DashboardController> {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Executive Dashboard Card
          const ExecutiveDashboardCard(),
          SizedBox(height: 16.h),

          // Stats Grid
          const StatsGrid(),
          SizedBox(height: 16.h),

          // Administrative Actions
          const AdministrativeActions(),
          SizedBox(height: 16.h),

          // Network Overview
          const NetworkOverview(),
          SizedBox(height: 16.h),

          // System Alerts
          const SystemAlerts(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
