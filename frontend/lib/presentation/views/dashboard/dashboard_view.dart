import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cms_system/presentation/controllers/dashboard_controller.dart';
import 'package:cms_system/presentation/controllers/app_drawer_controller.dart';
import 'package:cms_system/presentation/views/drawer/drawer_view.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/dashboard_header.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/dashboard_body.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the drawer controller
    Get.put(AppDrawerController());

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerView(),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header
            const DashboardHeader(),
            // Scrollable Body
            const Expanded(child: DashboardBody()),
          ],
        ),
      ),
    );
  }
}
