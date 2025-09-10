// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 400.w, // max-w-md equivalent
            maxHeight: MediaQuery.of(context).size.height * 0.9, // max-h-[90vh]
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r), // rounded-2xl
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with gradient background
              _buildProfileHeader(),
              // Profile content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      // User details section
                      _buildUserDetails(),
                      SizedBox(height: 16.h),
                      // Action buttons section
                      _buildActionButtons(),
                      SizedBox(height: 16.h),
                      // Logout button
                      _buildLogoutButton(),
                      SizedBox(height: 16.h),
                      // Footer
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3B82F6),
            Color(0xFF8B5CF6),
          ], // from-blue-500 to-purple-600
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          // Close button
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Profile image with badges
          _buildProfileImage(),
          SizedBox(height: 16.h),
          // User info
          Text(
            'Managing Director',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Executive Management',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 8.h),
          // Super Admin badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'Super Admin',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.amber[300],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Stats
          _buildStats(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Profile image
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 4),
          ),
          child: const Center(
            child: Text('👑', style: TextStyle(fontSize: 40)),
          ),
        ),
        // Crown badge
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: Colors.amber[500],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
        // Camera button
        Positioned(
          bottom: -8,
          right: -8,
          child: GestureDetector(
            onTap: () => controller.editProfile(),
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.camera_alt, color: Colors.blue[600], size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Visits
        _buildStatItem('156', 'Visits'),
        // Sales
        _buildStatItem('₹2.4L', 'Sales'),
        // Target
        _buildStatItem('94%', 'Target'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildUserDetails() {
    return Column(
      children: [
        // Email
        _buildDetailItem(
          icon: Icons.email,
          iconColor: Colors.blue[600]!,
          title: 'md@salesforce.com',
          subtitle: 'Email Address',
        ),
        SizedBox(height: 12.h),
        // User ID
        _buildDetailItem(
          icon: Icons.person,
          iconColor: Colors.green[600]!,
          title: 'super-admin-001',
          subtitle: 'User ID',
        ),
        SizedBox(height: 12.h),
        // Territory
        _buildDetailItem(
          icon: Icons.location_on,
          iconColor: Colors.purple[600]!,
          title: 'Not Assigned',
          subtitle: 'Territory',
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Edit Profile
        _buildActionButton(
          icon: Icons.edit,
          iconBgColor: Colors.grey[100]!,
          iconColor: Colors.grey[600]!,
          title: 'Edit Profile',
          onTap: () => controller.editProfile(),
        ),
        SizedBox(height: 8.h),
        // Super Admin Panel
        _buildSpecialActionButton(
          icon: Icons.workspace_premium,
          title: 'Super Admin Panel',
          badge: 'Super Admin',
          onTap: () => controller.openSuperAdminPanel(),
        ),
        SizedBox(height: 8.h),
        // Permission Test
        _buildSpecialActionButton(
          icon: Icons.security,
          title: 'Permission Test',
          badge: 'Super Admin',
          onTap: () => controller.openPermissionTest(),
        ),
        SizedBox(height: 8.h),
        // User Management
        _buildSpecialActionButton(
          icon: Icons.group,
          title: 'User Management',
          badge: 'Super Admin',
          onTap: () => controller.openUserManagement(),
        ),
        SizedBox(height: 8.h),
        // Settings
        _buildActionButton(
          icon: Icons.settings,
          iconBgColor: Colors.grey[100]!,
          iconColor: Colors.grey[600]!,
          title: 'Settings',
          onTap: () => controller.openSettings(),
        ),
        SizedBox(height: 8.h),
        // Notifications
        _buildActionButton(
          icon: Icons.notifications,
          iconBgColor: Colors.grey[100]!,
          iconColor: Colors.grey[600]!,
          title: 'Notifications',
          onTap: () => controller.openNotifications(),
        ),
        SizedBox(height: 8.h),
        // Change Password
        _buildActionButton(
          icon: Icons.lock,
          iconBgColor: Colors.grey[100]!,
          iconColor: Colors.grey[600]!,
          title: 'Change Password',
          onTap: () => controller.changePassword(),
        ),
        SizedBox(height: 8.h),
        // Help & Support
        _buildActionButton(
          icon: Icons.help,
          iconBgColor: Colors.grey[100]!,
          iconColor: Colors.grey[600]!,
          title: 'Help & Support',
          onTap: () => controller.openHelpSupport(),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialActionButton({
    required IconData icon,
    required String title,
    required String badge,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(
            0xFFFFFBEB,
          ), // bg-gradient-to-r from-yellow-50 to-orange-50
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFFDE68A), // border-yellow-200
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF59E0B),
                    Color(0xFFF97316),
                  ], // from-yellow-500 to-orange-500
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Icon(icon, color: Colors.white, size: 16),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF78350F), // text-orange-900
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B), // bg-yellow-500
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      badge,
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
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

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () => controller.logout(),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFEE2E2), // bg-red-50
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFECACA), // bg-red-100
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const Icon(
                Icons.logout,
                color: Color(0xFFDC2626), // text-red-600
                size: 16,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFDC2626), // text-red-600
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Divider(color: Colors.grey[200]),
        SizedBox(height: 16.h),
        Text(
          'SalesForce CRM v1.0.6 - Enterprise Edition',
          style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey[500]),
        ),
        SizedBox(height: 4.h),
        Text(
          '© 2024 SalesForce Solutions • Md Mehedi Hasan',
          style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey[400]),
        ),
      ],
    );
  }
}
