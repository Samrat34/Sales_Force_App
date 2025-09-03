// admin_users_card.dart
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
        leading: Icon(Icons.people, color: Colors.blue),
        title: Text('User Management'),
        subtitle: Text('View, approve, and manage all users'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Get.to(() => AdminUsersManagement());
        },
      ),
    );
  }
}
