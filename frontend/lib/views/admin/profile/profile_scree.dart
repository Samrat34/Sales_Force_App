import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/login_controller.dart';
import 'package:sales_force_app/views/admin/crm/crm_control_panel.dart';
import 'package:sales_force_app/views/admin/crm/notification_settings_screen.dart';
import 'package:sales_force_app/views/admin/crm/role_management.dart';
import 'package:sales_force_app/views/admin/crm/system_logs_screen.dart';
import 'package:sales_force_app/views/admin/profile/widgets/admin_users_card.dart';
import 'package:sales_force_app/views/admin/profile/widgets/admin_users_management.dart';
import 'package:sales_force_app/views/admin/profile/widgets/personal_info_card.dart';
import 'package:sales_force_app/views/admin/profile/widgets/profile_header.dart';
import 'package:sales_force_app/views/admin/profile/widgets/recent_activity_card.dart';
import 'package:sales_force_app/views/admin/profile/widgets/social_accounts_card.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final LoginController _loginController = Get.put(LoginController());
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final bool isAdmin = _loginController.userRole == 'super_admin';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: isAdmin ? _buildAdminFAB() : null,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 180,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[700]!, Colors.blue[500]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: Icon(isEditing ? Icons.save : Icons.edit,
                      color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                      if (!isEditing) {
                        Get.snackbar(
                          "Profile Updated",
                          "Your changes have been saved",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      }
                    });
                  },
                ),
                if (isAdmin)
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (value) =>
                        _handleAdminMenuSelection(value, context),
                    itemBuilder: (BuildContext context) {
                      return _buildAdminMenuItems();
                    },
                  ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProfileHeader(
                    isEditing: isEditing,
                    onEditToggle: (value) => setState(() => isEditing = value),
                  ),
                  PersonalInfoCard(isEditing: isEditing),
                  SizedBox(height: 16),
                  if (isAdmin) AdminUsersCard(),
                  if (isAdmin) SizedBox(height: 16),
                  SocialAccountsCard(),
                  SizedBox(height: 16),
                  RecentActivityCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Admin Floating Action Button
  Widget _buildAdminFAB() {
    return FloatingActionButton(
      onPressed: () => _showAdminControlPanel(context),
      backgroundColor: Colors.blue[700],
      tooltip: 'Admin Control Panel',
      child: Icon(Icons.admin_panel_settings, color: Colors.white),
    );
  }

  // Admin Menu Items
  List<PopupMenuItem<String>> _buildAdminMenuItems() {
    return [
      PopupMenuItem<String>(
        value: 'users',
        child: Row(
          children: [
            Icon(Icons.people, color: Colors.blue),
            SizedBox(width: 8),
            Text('Manage Users'),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'crm',
        child: Row(
          children: [
            Icon(Icons.settings, color: Colors.orange),
            SizedBox(width: 8),
            Text('CRM Settings'),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'roles',
        child: Row(
          children: [
            Icon(Icons.security, color: Colors.purple),
            SizedBox(width: 8),
            Text('Role Management'),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'reports',
        child: Row(
          children: [
            Icon(Icons.analytics, color: Colors.green),
            SizedBox(width: 8),
            Text('System Reports'),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'add_user',
        child: Row(
          children: [
            Icon(Icons.person_add, color: Colors.green),
            SizedBox(width: 8),
            Text('Add New User'),
          ],
        ),
      ),
    ];
  }

  // Handle Admin Menu Selection
  void _handleAdminMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'users':
        Get.to(() => AdminUsersManagement());
        break;
      case 'crm':
        Get.to(() => CrmControlPanel());
        break;
      case 'roles':
        Get.to(() => RoleManagementScreen());
        break;
      case 'reports':
        _showSystemReports(context);
        break;
      case 'add_user':
        _showAddUserDialog(context);
        break;
    }
  }

  // Show Admin Control Panel
  void _showAdminControlPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return AdminControlPanel();
      },
    );
  }

  // System Reports Dialog
  void _showSystemReports(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('System Reports'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildReportOption('Sales Performance', Icons.trending_up),
              _buildReportOption('User Activity', Icons.analytics),
              _buildReportOption('Client Statistics', Icons.people),
              _buildReportOption('System Health', Icons.health_and_safety),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildReportOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        // Generate and show report
        Get.snackbar('Report Generated', '$title report is being prepared');
        Navigator.pop(context);
      },
    );
  }

  // Add User Dialog (existing implementation)
  void _showAddUserDialog(BuildContext context) {
    // Your existing add user dialog implementation
  }
}

// Admin Control Panel Widget
class AdminControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Admin Control Panel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildControlButton('Users', Icons.people, Colors.blue,
                  () => Get.to(() => AdminUsersManagement())),
              _buildControlButton('CRM Settings', Icons.settings, Colors.orange,
                  () => Get.to(() => CrmControlPanel())),
              _buildControlButton('Roles', Icons.security, Colors.purple,
                  () => Get.to(() => RoleManagementScreen())),
              _buildControlButton('Reports', Icons.analytics, Colors.green,
                  () => _showQuickReports(context)),
              // _buildControlButton('Add User', Icons.person_add, Colors.teal,
              //     () => _showAddUserDialog(context)),
              _buildControlButton('System Logs', Icons.history, Colors.grey,
                  () => _showSystemLogs()),
              _buildControlButton('Backup', Icons.backup, Colors.blueGrey,
                  () => _performBackup()),
              _buildControlButton('Notifications', Icons.notifications,
                  Colors.red, () => _manageNotifications()),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close Panel'),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
      String label, IconData icon, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: color,
            iconSize: 30,
            onPressed: onPressed,
          ),
          Text(label,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  void _showQuickReports(BuildContext context) {
    // Quick reports implementation
  }

  void _showSystemLogs() {
    Get.to(() => SystemLogsScreen());
  }

  void _performBackup() {
    Get.dialog(
      AlertDialog(
        title: Text('System Backup'),
        content: Text('Create a backup of all system data?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar('Backup Started', 'System backup is in progress...');
            },
            child: Text('Backup'),
          ),
        ],
      ),
    );
  }

  void _manageNotifications() {
    Get.to(() =>
        NotificationSettingsScreen()); // Navigation to Notification Settings
  }

  // ignore: unused_element
  void _handleAdminMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'users':
        Get.to(() => AdminUsersManagement()); // Navigation to User Management
        break;
      case 'crm':
        Get.to(() => CrmControlPanel()); // Navigation to CRM Control Panel
        break;
      case 'roles':
        Get.to(() => RoleManagementScreen()); // Navigation to Role Management
        break;
    }
  }
}
