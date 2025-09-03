import 'package:Sales_Force_App/components/views/common/app_drawer.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/actions_buttons.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/dashboard_header.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/gradient_banner.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/recent_activity_section.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/stats_grid.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/todays_plan.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/working_status_section.dart';
import 'package:flutter/material.dart';

class SuperAdminDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(), // Use the AppDrawer here
      body: SafeArea(
        child: Column(
          children: [
            DashboardHeader(scaffoldKey: _scaffoldKey),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientBanner(),
                    SizedBox(height: 24),

                    // Stats Grid
                    StatsGrid(),
                    SizedBox(height: 24),

                    // Working Status Section
                    WorkingStatusSection(),
                    SizedBox(height: 16),
                    // to do list
                    TodaysPlanCard(),
                    SizedBox(height: 16),
                    // Actions Buttons
                    CompactActionButtonsGrid(),
                    SizedBox(height: 16),

                    // Recent Activity Section
                    RecentActivitySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
