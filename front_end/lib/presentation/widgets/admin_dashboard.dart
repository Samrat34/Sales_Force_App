import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/view_models/auth_viewmodel.dart';
import '../../domain/models/user_role.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();

    return Obx(() {
      final user = authViewModel.currentUser.value;
      if (user == null) {
        return const Center(child: CircularProgressIndicator());
      }

      // CORRECTED LINE: Access role through user object, not authViewModel
      final userRole = user.role;

      return Scaffold(
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: AppBar(
          title: const Text('SalesForce CRM'),
          backgroundColor: const Color(0xFF0066CC),
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            CircleAvatar(
              backgroundImage: user.profileImage != null
                  ? NetworkImage(user.profileImage!)
                  : null,
              child: user.profileImage == null ? Text(user.name[0]) : null,
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.crop,
                        size: 40,
                        color: Color(0xFFFFA000),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${userRole.name} Dashboard',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Welcome back, ${user.name}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Operational',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Rest of your dashboard content...
                // Make sure to use userRole instead of authViewModel.userRole
                if (userRole.canAccessAdminPanel) _buildAdminActions(userRole),

                // ... other dashboard widgets
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildAdminActions(UserRole userRole) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Administrative Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            if (userRole.canManageUsers)
              _buildAdminActionCard(
                title: 'Admin Panel',
                description: 'Manage users, permissions & settings',
                icon: Icons.settings,
                color: Colors.grey,
              ),
            if (userRole.canManagePermissions)
              _buildAdminActionCard(
                title: 'User Permissions',
                description: 'Control access & permission management',
                icon: Icons.shield,
                color: Colors.purple,
              ),
            if (userRole.canViewReports)
              _buildAdminActionCard(
                title: 'System Reports',
                description: 'Enterprise performance analytics',
                icon: Icons.bar_chart,
                color: Colors.green,
              ),
            if (userRole.canViewSecurityCenter)
              _buildAdminActionCard(
                title: 'Security Center',
                description: 'Monitor system security & compliance',
                icon: Icons.security,
                color: Colors.red,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdminActionCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
