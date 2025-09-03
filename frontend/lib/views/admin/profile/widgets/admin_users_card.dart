// admin_users_card.dart (optional - you can remove this if not needed)
import 'package:sales_force_app/views/admin/profile/widgets/admin_users_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUsersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.admin_panel_settings, color: Colors.blue),
        title: Text('Admin Panel'),
        subtitle: Text('Access user management options'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Show the admin options bottom sheet
          _showAdminOptions(context);
        },
      ),
    );
  }

  void _showAdminOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Admin Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.people, color: Colors.blue),
                title: Text('Manage Users'),
                subtitle: Text('View, approve, and manage all users'),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => AdminUsersManagement());
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add, color: Colors.green),
                title: Text('Add New User'),
                subtitle:
                    Text('Create new user accounts with login credentials'),
                onTap: () {
                  Navigator.pop(context);
                  // You would call the add user dialog here
                },
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
