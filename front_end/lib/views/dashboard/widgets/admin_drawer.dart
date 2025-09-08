import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/view_models/auth_viewmodel.dart';
import '../../../../domain/models/user_role.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();

    return Drawer(
      child: Obx(() {
        final user = authViewModel.currentUser.value;
        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[500]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: user.profileImage != null
                        ? NetworkImage(user.profileImage!)
                        : null,
                    child: user.profileImage == null
                        ? Text(
                            user.name[0],
                            style: const TextStyle(fontSize: 24),
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.role.name,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            if (user.role.canManageUsers)
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('User Management'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to user management
                },
              ),
            if (user.role.canManagePermissions)
              ListTile(
                leading: const Icon(Icons.shield),
                title: const Text('Permissions'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to permissions
                },
              ),
            if (user.role.canViewReports)
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text('Reports'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to reports
                },
              ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                authViewModel.logout();
              },
            ),
          ],
        );
      }),
    );
  }
}
