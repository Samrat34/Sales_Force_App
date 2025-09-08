import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/domain/models/user_model.dart';
import '../../../../domain/view_models/auth_viewmodel.dart';
import '../../../../domain/models/user_role.dart';

class DashboardContent extends StatelessWidget {
  DashboardContent({Key? key}) : super(key: key);

  final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = authViewModel.currentUser.value;
      if (user == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(user),
            const SizedBox(height: 24),

            // Stats Grid
            _buildStatsGrid(),
            const SizedBox(height: 24),

            // Administrative Actions (based on role)
            if (user.role.canAccessAdminPanel) _buildAdminActions(),
            const SizedBox(height: 24),

            // Network Overview
            _buildNetworkOverview(),
            const SizedBox(height: 24),

            // System Alerts
            _buildSystemAlerts(),
          ],
        ),
      );
    });
  }

  Widget _buildHeader(UserModel user) {
    return Container(
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
          // const Icon(Icons.crown, size: 40, color: Color(0xFFFFA000)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Executive Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Welcome back, ${user.name}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
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
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildStatCard(
          title: 'Total Revenue',
          value: '₹0.8L',
          icon: Icons.attach_money,
          color: Colors.green,
          trend: '+12.5%',
        ),
        _buildStatCard(
          title: 'Active Clients',
          value: '1',
          icon: Icons.business,
          color: Colors.blue,
          trend: '+8.2%',
        ),
        _buildStatCard(
          title: 'Total Users',
          value: '5',
          icon: Icons.people,
          color: Colors.purple,
          trend: '+15.3%',
        ),
        _buildStatCard(
          title: 'Network Outlets',
          value: '4',
          icon: Icons.public,
          color: Colors.orange,
          trend: '+5.7%',
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String trend,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  trend,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildAdminActions() {
    final user = authViewModel.currentUser.value!;

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
            if (user.role.canManageUsers)
              _buildAdminActionCard(
                title: 'Admin Panel',
                description: 'Manage users, permissions & settings',
                icon: Icons.settings,
                color: Colors.grey,
              ),
            if (user.role.canManagePermissions)
              _buildAdminActionCard(
                title: 'User Permissions',
                description: 'Control access & permission management',
                icon: Icons.shield,
                color: Colors.purple,
              ),
            if (user.role.canViewReports)
              _buildAdminActionCard(
                title: 'System Reports',
                description: 'Enterprise performance analytics',
                icon: Icons.bar_chart,
                color: Colors.green,
              ),
            if (user.role.canViewSecurityCenter)
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

  Widget _buildNetworkOverview() {
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
          const Row(
            children: [
              Icon(Icons.show_chart, color: Colors.purple),
              SizedBox(width: 8),
              Text(
                'Network Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNetworkStat('1', 'Company Staff', Colors.blue),
              _buildNetworkStat('1', 'Field Staff', Colors.purple),
              _buildNetworkStat('3', 'Active Outlets', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildSystemAlerts() {
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
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                'System Alerts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAlertItem(
            title: 'Server Maintenance',
            description: 'Scheduled maintenance on Jan 20, 2025 at 2:00 AM',
            time: '2 hours ago',
            color: Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildAlertItem(
            title: 'New Feature Release',
            description: 'Advanced analytics module is now available',
            time: '4 hours ago',
            color: Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildAlertItem(
            title: 'Backup Completed',
            description: 'Daily system backup completed successfully',
            time: '6 hours ago',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem({
    required String title,
    required String description,
    required String time,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
