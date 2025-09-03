// notification_settings_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final Map<String, bool> _notificationSettings = {
    'email_notifications': true,
    'push_notifications': true,
    'sms_notifications': false,
    'sales_alerts': true,
    'support_tickets': true,
    'system_updates': true,
    'security_alerts': true,
    'marketing_emails': false,
    'weekly_reports': true,
    'daily_digest': false,
  };

  final Map<String, Map<String, bool>> _channelSettings = {
    'Email': {
      'lead_assigned': true,
      'deal_closed': true,
      'payment_received': true,
      'support_ticket': false,
    },
    'Push': {
      'urgent_alerts': true,
      'meeting_reminders': true,
      'task_deadlines': true,
      'new_messages': true,
    },
    'SMS': {
      'critical_alerts': true,
      'two_factor_codes': true,
      'system_outages': false,
    },
  };

  String _selectedCategory = 'general';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Colors.purple[700],
        actions: [
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: _resetToDefaults,
            tooltip: 'Reset to Defaults',
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Selection
          _buildCategorySelector(),

          // Settings Content
          Expanded(
            child: _buildSettingsContent(),
          ),

          // Save Button
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    final categories = [
      {'id': 'general', 'label': 'General', 'icon': Icons.settings},
      {'id': 'email', 'label': 'Email', 'icon': Icons.email},
      {'id': 'push', 'label': 'Push', 'icon': Icons.notifications},
      {'id': 'sms', 'label': 'SMS', 'icon': Icons.sms},
    ];

    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.grey[100],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Row(
                  children: [
                    Icon(category['icon'] as IconData, size: 16),
                    SizedBox(width: 4),
                    Text(category['label'] as String),
                  ],
                ),
                selected: _selectedCategory == category['id'],
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory =
                        selected ? category['id'] as String : 'general';
                  });
                },
                selectedColor: Colors.purple,
                labelStyle: TextStyle(
                  color: _selectedCategory == category['id']
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSettingsContent() {
    switch (_selectedCategory) {
      case 'email':
        return _buildEmailSettings();
      case 'push':
        return _buildPushSettings();
      case 'sms':
        return _buildSmsSettings();
      default:
        return _buildGeneralSettings();
    }
  }

  Widget _buildGeneralSettings() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Notification Preferences'),
        _buildSettingSwitch(
          'Email Notifications',
          'Receive notifications via email',
          'email_notifications',
          Icons.email,
        ),
        _buildSettingSwitch(
          'Push Notifications',
          'Receive push notifications on your devices',
          'push_notifications',
          Icons.notifications,
        ),
        _buildSettingSwitch(
          'SMS Notifications',
          'Receive SMS alerts (carrier charges may apply)',
          'sms_notifications',
          Icons.sms,
        ),
        SizedBox(height: 24),
        _buildSectionHeader('Notification Types'),
        _buildSettingSwitch(
          'Sales Alerts',
          'Notifications about sales and deals',
          'sales_alerts',
          Icons.attach_money,
        ),
        _buildSettingSwitch(
          'Support Tickets',
          'Alerts about support ticket updates',
          'support_tickets',
          Icons.support_agent,
        ),
        _buildSettingSwitch(
          'System Updates',
          'Important system maintenance notifications',
          'system_updates',
          Icons.system_update,
        ),
        _buildSettingSwitch(
          'Security Alerts',
          'Critical security notifications',
          'security_alerts',
          Icons.security,
        ),
        SizedBox(height: 24),
        _buildSectionHeader('Reports & Digests'),
        _buildSettingSwitch(
          'Marketing Emails',
          'Promotional and marketing communications',
          'marketing_emails',
          Icons.campaign,
        ),
        _buildSettingSwitch(
          'Weekly Reports',
          'Weekly performance summary reports',
          'weekly_reports',
          Icons.analytics,
        ),
        _buildSettingSwitch(
          'Daily Digest',
          'Daily summary of activities',
          'daily_digest',
          Icons.summarize,
        ),
      ],
    );
  }

  Widget _buildEmailSettings() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Email Notification Settings'),
        _buildChannelSettingSwitch(
          'Lead Assigned',
          'When a new lead is assigned to you',
          'Email',
          'lead_assigned',
          Icons.leaderboard,
        ),
        _buildChannelSettingSwitch(
          'Deal Closed',
          'When a deal is successfully closed',
          'Email',
          'deal_closed',
          Icons.check_circle,
        ),
        _buildChannelSettingSwitch(
          'Payment Received',
          'When a payment is received',
          'Email',
          'payment_received',
          Icons.payment,
        ),
        _buildChannelSettingSwitch(
          'Support Ticket Updates',
          'Updates on support tickets you created',
          'Email',
          'support_ticket',
          Icons.support,
        ),
        SizedBox(height: 24),
        _buildSectionHeader('Email Preferences'),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Delivery Time'),
          subtitle: Text('Set preferred time for daily emails'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showDeliveryTimePicker(),
        ),
        ListTile(
          leading: Icon(Icons.format_list_bulleted),
          title: Text('Email Format'),
          subtitle: Text('HTML or Plain Text'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showEmailFormatDialog(),
        ),
      ],
    );
  }

  Widget _buildPushSettings() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Push Notification Settings'),
        _buildChannelSettingSwitch(
          'Urgent Alerts',
          'Immediate push notifications for urgent matters',
          'Push',
          'urgent_alerts',
          Icons.warning,
        ),
        _buildChannelSettingSwitch(
          'Meeting Reminders',
          'Reminders for upcoming meetings',
          'Push',
          'meeting_reminders',
          Icons.event,
        ),
        _buildChannelSettingSwitch(
          'Task Deadlines',
          'Notifications for approaching deadlines',
          'Push',
          'task_deadlines',
          Icons.task,
        ),
        _buildChannelSettingSwitch(
          'New Messages',
          'When you receive new messages',
          'Push',
          'new_messages',
          Icons.message,
        ),
        SizedBox(height: 24),
        _buildSectionHeader('Push Preferences'),
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text('Notification Sound'),
          subtitle: Text('Default tone'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showSoundPicker(),
        ),
        ListTile(
          leading: Icon(Icons.vibration),
          title: Text('Vibration Pattern'),
          subtitle: Text('Default pattern'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showVibrationSettings(),
        ),
      ],
    );
  }

  Widget _buildSmsSettings() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildSectionHeader('SMS Notification Settings'),
        Text(
          'SMS notifications may incur carrier charges. Use only for critical alerts.',
          style: TextStyle(color: Colors.orange[700], fontSize: 12),
        ),
        SizedBox(height: 16),
        _buildChannelSettingSwitch(
          'Critical Alerts',
          'SMS for extremely critical situations',
          'SMS',
          'critical_alerts',
          Icons.error,
        ),
        _buildChannelSettingSwitch(
          'Two-Factor Codes',
          'SMS codes for two-factor authentication',
          'SMS',
          'two_factor_codes',
          Icons.lock,
        ),
        _buildChannelSettingSwitch(
          'System Outages',
          'SMS alerts for major system outages',
          'SMS',
          'system_outages',
          Icons.cloud_off,
        ),
        SizedBox(height: 24),
        _buildSectionHeader('SMS Preferences'),
        ListTile(
          leading: Icon(Icons.phone_iphone),
          title: Text('Phone Number'),
          subtitle: Text('+1 (555) 123-4567'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showPhoneNumberDialog(),
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('SMS Hours'),
          subtitle: Text('9:00 AM - 6:00 PM'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showSmsHoursDialog(),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.purple[700],
        ),
      ),
    );
  }

  Widget _buildSettingSwitch(
      String title, String subtitle, String key, IconData icon) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      value: _notificationSettings[key] ?? false,
      onChanged: (value) {
        setState(() {
          _notificationSettings[key] = value;
        });
      },
      secondary: Icon(icon, color: Colors.purple),
    );
  }

  Widget _buildChannelSettingSwitch(String title, String subtitle,
      String channel, String key, IconData icon) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      value: _channelSettings[channel]?[key] ?? false,
      onChanged: (value) {
        setState(() {
          _channelSettings[channel]?[key] = value;
        });
      },
      secondary: Icon(icon, color: Colors.purple),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _saveSettings,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[700],
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            'Save Changes',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _saveSettings() {
    // Simulate saving settings
    Get.snackbar(
      'Settings Saved',
      'Your notification preferences have been updated',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _resetToDefaults() {
    Get.dialog(
      AlertDialog(
        title: Text('Reset to Defaults'),
        content: Text(
            'Are you sure you want to reset all notification settings to their default values?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                // Reset all settings to default values
                _notificationSettings.updateAll((key, value) =>
                    key == 'email_notifications' ||
                    key == 'push_notifications');
                _channelSettings.forEach((channel, settings) {
                  settings.updateAll((key, value) => true);
                });
              });
              Get.back();
              Get.snackbar(
                'Settings Reset',
                'All settings have been reset to defaults',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text('Reset', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showDeliveryTimePicker() {
    // Implementation for time picker
  }

  void _showEmailFormatDialog() {
    // Implementation for email format dialog
  }

  void _showSoundPicker() {
    // Implementation for sound picker
  }

  void _showVibrationSettings() {
    // Implementation for vibration settings
  }

  void _showPhoneNumberDialog() {
    // Implementation for phone number dialog
  }

  void _showSmsHoursDialog() {
    // Implementation for SMS hours dialog
  }
}
