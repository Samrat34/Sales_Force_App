// crm_control_panel.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrmControlPanel extends StatelessWidget {
  final Map<String, bool> crmSettings = {
    'Lead Management': true,
    'Sales Pipeline': true,
    'Customer Support': true,
    'Email Integration': false,
    'SMS Notifications': true,
    'Auto Follow-ups': false,
    'Performance Analytics': true,
    'Inventory Management': true,
  }.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRM Control Panel'),
        backgroundColor: Colors.orange[700],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CRM System Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildSettingCard(
                        'Lead Management',
                        'Manage incoming leads and conversions',
                        Icons.leaderboard),
                    _buildSettingCard(
                        'Sales Pipeline',
                        'Configure sales stages and workflows',
                        Icons.account_tree),
                    _buildSettingCard(
                        'Customer Support',
                        'Ticket system and support management',
                        Icons.support_agent),
                    _buildSettingCard('Email Integration',
                        'Connect email services', Icons.email),
                    _buildSettingCard(
                        'SMS Notifications', 'Configure SMS alerts', Icons.sms),
                    _buildSettingCard('Auto Follow-ups',
                        'Automatic customer follow-ups', Icons.autorenew),
                    _buildSettingCard('Performance Analytics',
                        'Sales performance tracking', Icons.analytics),
                    _buildSettingCard('Inventory Management',
                        'Product and stock management', Icons.inventory),
                  ],
                ),
              ),
              _buildSystemActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard(String title, String description, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Switch(
          value: crmSettings[title] ?? false,
          onChanged: (value) {
            crmSettings[title] = value;
            Get.snackbar(
                'Setting Updated', '$title ${value ? 'enabled' : 'disabled'}');
          },
        ),
      ),
    );
  }

  Widget _buildSystemActions() {
    return Column(
      children: [
        Divider(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.restart_alt),
              label: Text('Restart CRM'),
              onPressed: _restartCrm,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.backup),
              label: Text('Backup Data'),
              onPressed: _backupCrmData,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.settings_backup_restore),
              label: Text('Reset'),
              onPressed: _resetCrmSettings,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ],
    );
  }

  void _restartCrm() {
    Get.dialog(
      AlertDialog(
        title: Text('Restart CRM System'),
        content: Text('This will restart all CRM services. Continue?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                  'CRM Restarting', 'System will restart in 5 seconds...');
            },
            child: Text('Restart'),
          ),
        ],
      ),
    );
  }

  void _backupCrmData() {
    // Backup implementation
  }

  void _resetCrmSettings() {
    // Reset implementation
  }
}
