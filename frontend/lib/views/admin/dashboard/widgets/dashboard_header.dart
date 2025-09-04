// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/login_controller.dart';
import 'package:sales_force_app/views/admin/profile/profile_scree.dart';

class DashboardHeader extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardHeader({super.key, required this.scaffoldKey});

  @override
  _DashboardHeaderState createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  bool _isNotificationHovered = false;
  bool _isProfileHovered = false;
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu button
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF805AD5)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => widget.scaffoldKey.currentState?.openDrawer(),
            ),
          ),

          // Title
          Text(
            "Admin Dashboard",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),

          // Right side buttons
          Row(
            children: [
              _buildNotificationButton(),
              SizedBox(width: 16),
              _buildProfileButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isNotificationHovered = true),
      onExit: (_) => setState(() => _isNotificationHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: _isNotificationHovered
            ? (Matrix4.identity()..scale(1.1))
            : Matrix4.identity(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _showNotifications,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    // Bell Icon
                    Icon(
                      Icons.notifications_none,
                      size: 24,
                      color: Colors.grey[700],
                    ),

                    // Notification Badge
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '12',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isProfileHovered = true),
      onExit: (_) => setState(() => _isProfileHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: _isProfileHovered
            ? (Matrix4.identity()..scale(1.1))
            : Matrix4.identity(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.blue[500]!, Colors.purple[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _showProfileMenu,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '👨‍💼',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showNotifications() {
    // Show notifications panel or navigate to notifications screen
    Get.snackbar(
      'Notifications',
      'You have 12 unread notifications',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue[50],
      colorText: Colors.blue[900],
    );
  }

  void _showProfileMenu() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue[100],
                child: Text(
                  '👨‍💼',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox(height: 16),
              Text(
                _loginController.user?.name ?? 'Super Admin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                _loginController.user?.email ?? 'admin@company.com',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 24),

              // Profile Options
              _buildProfileOption('Profile Settings', Icons.person,
                  onTap: _navigateToProfile),
              _buildProfileOption('Account Settings', Icons.settings,
                  onTap: _showAccountSettings),
              _buildProfileOption('Help & Support', Icons.help,
                  onTap: _showHelpSupport),
              _buildProfileOption('Logout', Icons.logout,
                  onTap: _handleLogout, isLogout: true),

              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileOption(String title, IconData icon,
      {bool isLogout = false, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.blue),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigateToProfile() {
    Navigator.pop(context); // Close the bottom sheet
    Get.to(() => UserProfilePage()); // Navigate to profile page
  }

  void _showAccountSettings() {
    Navigator.pop(context);
    Get.snackbar(
      'Account Settings',
      'Account settings page coming soon',
      backgroundColor: Colors.blue[50],
      colorText: Colors.blue[900],
    );
  }

  void _showHelpSupport() {
    Navigator.pop(context);
    Get.snackbar(
      'Help & Support',
      'Help center will be available soon',
      backgroundColor: Colors.blue[50],
      colorText: Colors.blue[900],
    );
  }

  void _handleLogout() {
    Navigator.pop(context); // Close the bottom sheet first

    Get.dialog(
      AlertDialog(
        title: Text('Logout', style: TextStyle(color: Colors.blue[800])),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
              _performLogout(); // Perform logout
            },
            child: Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _performLogout() {
    // Call the logout method from the login controller
    _loginController.logout();

    Get.snackbar(
      'Logged Out',
      'You have been successfully logged out',
      backgroundColor: Colors.green[50],
      colorText: Colors.green[900],
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
