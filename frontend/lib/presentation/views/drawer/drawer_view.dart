import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/app_drawer_controller.dart';

class DrawerView extends GetView<AppDrawerController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 16,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header with gradient background
            _buildDrawerHeader(),
            // Menu sections
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main section
                    _buildMenuSection(
                      title: 'Main',
                      items: [
                        _buildMenuItem(
                          icon: Icons.home,
                          title: 'Dashboard',
                          isActive: true,
                        ),
                        _buildMenuItem(icon: Icons.store, title: 'Outlets'),
                        _buildMenuItem(
                          icon: Icons.shopping_bag,
                          title: 'Orders',
                        ),
                        _buildMenuItem(icon: Icons.bar_chart, title: 'Reports'),
                      ],
                    ),
                    // Field Operations section
                    _buildMenuSection(
                      title: 'Field Operations',
                      items: [
                        _buildMenuItem(
                          icon: Icons.access_time,
                          title: 'Attendance & Check-in',
                        ),
                        _buildMenuItem(
                          icon: Icons.calendar_today,
                          title: 'Daily Planning',
                        ),
                        _buildMenuItem(
                          icon: Icons.location_on,
                          title: 'GPS Tracking',
                        ),
                        _buildMenuItem(
                          icon: Icons.store,
                          title: 'Outlet Management',
                        ),
                      ],
                    ),
                    // Sales & Orders section
                    _buildMenuSection(
                      title: 'Sales & Orders',
                      items: [
                        _buildMenuItem(
                          icon: Icons.shopping_bag,
                          title: 'Sales Orders',
                        ),
                        _buildMenuItem(
                          icon: Icons.local_shipping,
                          title: 'Delivery & Logistics',
                        ),
                        _buildMenuItem(
                          icon: Icons.assignment_return,
                          title: 'Sales Returns',
                        ),
                        _buildMenuItem(
                          icon: Icons.local_offer,
                          title: 'Discounts & Promotions',
                        ),
                      ],
                    ),
                    // Inventory & Assets section
                    _buildMenuSection(
                      title: 'Inventory & Assets',
                      items: [
                        _buildMenuItem(
                          icon: Icons.inventory_2,
                          title: 'Inventory Management',
                        ),
                        _buildMenuItem(
                          icon: Icons.security,
                          title: 'Asset Management',
                        ),
                        _buildMenuItem(
                          icon: Icons.camera_alt,
                          title: 'Product Visibility',
                        ),
                      ],
                    ),
                    // Financial & Compliance section
                    _buildMenuSection(
                      title: 'Financial & Compliance',
                      items: [
                        _buildMenuItem(
                          icon: Icons.attach_money,
                          title: 'Travel Allowance (TA/DA)',
                        ),
                        _buildMenuItem(
                          icon: Icons.attach_money,
                          title: 'Payment Collection',
                        ),
                        _buildMenuItem(
                          icon: Icons.security,
                          title: 'Compliance & Geo-tracking',
                        ),
                      ],
                    ),
                    // Engagement & Analytics section
                    _buildMenuSection(
                      title: 'Engagement & Analytics',
                      items: [
                        _buildMenuItem(
                          icon: Icons.description,
                          title: 'Surveys & Campaigns',
                        ),
                        _buildMenuItem(
                          icon: Icons.menu_book,
                          title: 'Learning & Training',
                        ),
                        _buildMenuItem(
                          icon: Icons.trending_up,
                          title: 'Performance Monitoring',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            _buildDrawerFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        // Adjusted padding to prevent overflow
        padding: EdgeInsets.only(
          left: 16.w,
          top: 16.w,
          right: 10.w,
          bottom: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // App logo and title
                Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(
                        Icons.store,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SalesForce CRM',
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Field Sales Management',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Close button - adjusted size and padding
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 36.w, // Reduced from 40.w
                    height: 36.w, // Reduced from 40.w
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18, // Reduced from 20
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // User profile section
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Center(
                      child: Text('👑', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Managing Director',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Executive Management',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            const Text('👑', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 4.w),
                            Text(
                              'Super Admin',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xFFFBBF24),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              letterSpacing: 1,
            ),
          ),
        ),
        Column(children: items),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool isActive = false,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.setActiveMenuItem(title),
        child: Container(
          margin: EdgeInsets.only(bottom: 4.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: controller.activeMenuItem.value == title
                ? const Color(0xFFEFF6FF)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20.w,
                color: controller.activeMenuItem.value == title
                    ? const Color(0xFF2563EB)
                    : Colors.grey[600],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: controller.activeMenuItem.value == title
                        ? const Color(0xFF2563EB)
                        : Colors.grey[700],
                  ),
                ),
              ),
              if (controller.activeMenuItem.value == title)
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerFooter() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Version 2.1.0',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
          Text(
            '© SalesForce CRM',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
