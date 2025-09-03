// admin_users_management.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/user_controller.dart';

class AdminUsersManagement extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filter and search section
            _buildFilterSection(),
            Expanded(
              child: Obx(() {
                if (userController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (userController.filteredUsers.isEmpty) {
                  return Center(
                    child: Text(
                      'No users found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: userController.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = userController.filteredUsers[index];
                    return _buildUserCard(user);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search users...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            onChanged: (value) => userController.searchUsers(value),
          ),
          SizedBox(height: 12),
          Obx(() => Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: Text('All (${userController.allUsers.length})'),
                    selected: userController.selectedFilter.value == 'all',
                    onSelected: (_) => userController.filterUsers('all'),
                  ),
                  FilterChip(
                    label:
                        Text('Pending (${userController.pendingUsers.length})'),
                    selected: userController.selectedFilter.value == 'pending',
                    onSelected: (_) => userController.filterUsers('pending'),
                  ),
                  FilterChip(
                    label: Text(
                        'Approved (${userController.approvedUsers.length})'),
                    selected: userController.selectedFilter.value == 'approved',
                    onSelected: (_) => userController.filterUsers('approved'),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildUserCard(User user) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            user.name.substring(0, 1).toUpperCase(),
            style:
                TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            Text(user.role),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: user.status == 'approved'
                    ? Colors.green[100]
                    : Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                user.status.toUpperCase(),
                style: TextStyle(
                  color: user.status == 'approved'
                      ? Colors.green[800]
                      : Colors.orange[800],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user.status == 'pending')
              IconButton(
                icon: Icon(Icons.check_circle, color: Colors.green),
                onPressed: () => userController.approveUser(user.id),
              ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _showDeleteConfirmation(user),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(User user) {
    Get.dialog(
      AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              userController.deleteUser(user.id);
              Get.back();
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
