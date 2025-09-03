// role_management.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> roles = [
    {
      'name': 'Super Admin',
      'permissions': ['all'],
      'users': 1,
      'color': Colors.red
    },
    {
      'name': 'Sales Manager',
      'permissions': ['view_reports', 'manage_team', 'approve_deals'],
      'users': 3,
      'color': Colors.blue
    },
    {
      'name': 'Sales Rep',
      'permissions': ['create_leads', 'view_own_data', 'update_contacts'],
      'users': 15,
      'color': Colors.green
    },
    {
      'name': 'Client',
      'permissions': ['view_own_account', 'make_requests'],
      'users': 250,
      'color': Colors.purple
    },
    {
      'name': 'Support Agent',
      'permissions': ['handle_tickets', 'view_customers'],
      'users': 5,
      'color': Colors.orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Management'),
        backgroundColor: Colors.purple[700],
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _addNewRole),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildRoleStats(),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: roles.length,
                  itemBuilder: (context, index) => _buildRoleCard(roles[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleStats() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('Total Roles', '5', Icons.security),
            _buildStatItem('Total Users', '274', Icons.people),
            _buildStatItem('Active', '4', Icons.check_circle),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRoleCard(Map<String, dynamic> role) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: role['color'],
          child: Text(role['name'][0], style: TextStyle(color: Colors.white)),
        ),
        title:
            Text(role['name'], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${role['users']} users'),
            SizedBox(height: 4),
            Wrap(
              spacing: 4,
              children: (role['permissions'] as List)
                  .take(3)
                  .map((perm) => Chip(
                        label: Text(perm, style: TextStyle(fontSize: 10)),
                        backgroundColor: Colors.grey[200],
                      ))
                  .toList(),
            ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(value: 'edit', child: Text('Edit Role')),
            PopupMenuItem(value: 'users', child: Text('View Users')),
            PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
            PopupMenuItem(
                value: 'delete',
                child: Text('Delete', style: TextStyle(color: Colors.red))),
          ],
          onSelected: (value) => _handleRoleAction(Get as String, role),
        ),
      ),
    );
  }

  void _handleRoleAction(String action, Map<String, dynamic> role) {
    switch (action) {
      case 'edit':
        _editRole(role);
        break;
      case 'users':
        _viewRoleUsers(role);
        break;
      case 'duplicate':
        _duplicateRole(role);
        break;
      case 'delete':
        _deleteRole(role);
        break;
    }
  }

  void _addNewRole() {
    Get.dialog(
      AlertDialog(
        title: Text('Create New Role'),
        content: Text('Role creation form would go here'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(onPressed: () => Get.back(), child: Text('Create')),
        ],
      ),
    );
  }

  void _editRole(Map<String, dynamic> role) {
    // Edit role implementation
  }

  void _viewRoleUsers(Map<String, dynamic> role) {
    // View users implementation
  }

  void _duplicateRole(Map<String, dynamic> role) {
    // Duplicate role implementation
  }

  void _deleteRole(Map<String, dynamic> role) {
    // Delete role implementation
  }
}
