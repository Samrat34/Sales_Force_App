// system_logs_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SystemLogsScreen extends StatefulWidget {
  @override
  _SystemLogsScreenState createState() => _SystemLogsScreenState();
}

class _SystemLogsScreenState extends State<SystemLogsScreen> {
  final List<SystemLog> _logs = [
    SystemLog(
      id: '1',
      type: 'info',
      message: 'System started successfully',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      user: 'System',
      module: 'Authentication',
    ),
    SystemLog(
      id: '2',
      type: 'warning',
      message: 'Failed login attempt detected',
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      user: 'john.doe@example.com',
      module: 'Security',
    ),
    SystemLog(
      id: '3',
      type: 'error',
      message: 'Database connection timeout',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      user: 'System',
      module: 'Database',
    ),
    SystemLog(
      id: '4',
      type: 'success',
      message: 'User account created successfully',
      timestamp: DateTime.now().subtract(Duration(minutes: 20)),
      user: 'admin@crm.com',
      module: 'User Management',
    ),
    SystemLog(
      id: '5',
      type: 'info',
      message: 'Backup completed successfully',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      user: 'System',
      module: 'Backup',
    ),
    SystemLog(
      id: '6',
      type: 'warning',
      message: 'Low disk space warning',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      user: 'System',
      module: 'System Health',
    ),
    SystemLog(
      id: '7',
      type: 'error',
      message: 'Email service connection failed',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      user: 'System',
      module: 'Email Service',
    ),
    SystemLog(
      id: '8',
      type: 'success',
      message: 'Sales report generated successfully',
      timestamp: DateTime.now().subtract(Duration(hours: 4)),
      user: 'sales@crm.com',
      module: 'Reports',
    ),
  ];

  String _selectedFilter = 'all';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredLogs = _filterLogs();

    return Scaffold(
      appBar: AppBar(
        title: Text('System Logs'),
        backgroundColor: Colors.blueGrey[700],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshLogs,
            tooltip: 'Refresh Logs',
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportLogs,
            tooltip: 'Export Logs',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter and Search Section
          _buildFilterSection(),

          // Logs Counter
          _buildLogsCounter(filteredLogs.length),

          // Logs List
          Expanded(
            child: filteredLogs.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: filteredLogs.length,
                    itemBuilder: (context, index) =>
                        _buildLogItem(filteredLogs[index]),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearLogs,
        backgroundColor: Colors.red,
        tooltip: 'Clear All Logs',
        child: Icon(Icons.delete_sweep),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search logs...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
          ),
          SizedBox(height: 12),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', 'all'),
                _buildFilterChip('Info', 'info'),
                _buildFilterChip('Warnings', 'warning'),
                _buildFilterChip('Errors', 'error'),
                _buildFilterChip('Success', 'success'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: _selectedFilter == value,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = selected ? value : 'all';
          });
        },
        selectedColor: Colors.blue,
        labelStyle: TextStyle(
          color: _selectedFilter == value ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildLogsCounter(int count) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.blueGrey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Logs: $count',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Last updated: ${DateFormat('HH:mm:ss').format(DateTime.now())}',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLogItem(SystemLog log) {
    Color getLogColor() {
      switch (log.type) {
        case 'error':
          return Colors.red;
        case 'warning':
          return Colors.orange;
        case 'success':
          return Colors.green;
        case 'info':
          return Colors.blue;
        default:
          return Colors.grey;
      }
    }

    IconData getLogIcon() {
      switch (log.type) {
        case 'error':
          return Icons.error;
        case 'warning':
          return Icons.warning;
        case 'success':
          return Icons.check_circle;
        case 'info':
          return Icons.info;
        default:
          return Icons.message;
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 1,
      child: ListTile(
        leading: Icon(getLogIcon(), color: getLogColor()),
        title: Text(
          log.message,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              'Module: ${log.module} • User: ${log.user}',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 2),
            Text(
              DateFormat('yyyy-MM-dd HH:mm:ss').format(log.timestamp),
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.content_copy, size: 18),
          onPressed: () => _copyLogDetails(log),
          tooltip: 'Copy Log Details',
        ),
        onTap: () => _showLogDetails(log),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
          SizedBox(height: 16),
          Text(
            'No logs found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Try adjusting your filters or search terms',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  List<SystemLog> _filterLogs() {
    return _logs.where((log) {
      final matchesType =
          _selectedFilter == 'all' || log.type == _selectedFilter;
      final matchesSearch = _searchQuery.isEmpty ||
          log.message.toLowerCase().contains(_searchQuery) ||
          log.user.toLowerCase().contains(_searchQuery) ||
          log.module.toLowerCase().contains(_searchQuery);
      return matchesType && matchesSearch;
    }).toList();
  }

  void _refreshLogs() {
    setState(() {
      // Simulate loading new logs
      _logs.add(SystemLog(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: 'info',
        message: 'Logs refreshed manually',
        timestamp: DateTime.now(),
        user: 'admin@crm.com',
        module: 'System Logs',
      ));
    });

    Get.snackbar(
      'Logs Refreshed',
      'System logs have been updated',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _exportLogs() {
    Get.dialog(
      AlertDialog(
        title: Text('Export Logs'),
        content: Text('Choose export format:'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _exportAsCSV();
            },
            child: Text('CSV'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _exportAsJSON();
            },
            child: Text('JSON'),
          ),
        ],
      ),
    );
  }

  void _exportAsCSV() {
    Get.snackbar(
      'Export Started',
      'Logs are being exported as CSV',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }

  void _exportAsJSON() {
    Get.snackbar(
      'Export Started',
      'Logs are being exported as JSON',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }

  void _clearLogs() {
    Get.dialog(
      AlertDialog(
        title: Text('Clear All Logs'),
        content: Text(
            'Are you sure you want to clear all system logs? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _logs.clear();
              });
              Get.back();
              Get.snackbar(
                'Logs Cleared',
                'All system logs have been removed',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
              );
            },
            child: Text('Clear All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showLogDetails(SystemLog log) {
    Get.dialog(
      AlertDialog(
        title: Text('Log Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Type', log.type.toUpperCase()),
              _buildDetailRow('Message', log.message),
              _buildDetailRow('Module', log.module),
              _buildDetailRow('User', log.user),
              _buildDetailRow('Timestamp',
                  DateFormat('yyyy-MM-dd HH:mm:ss').format(log.timestamp)),
              _buildDetailRow('Log ID', log.id),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _copyLogDetails(SystemLog log) {
    // In a real app, you would use Clipboard.setData
    Get.snackbar(
      'Copied',
      'Log details copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class SystemLog {
  final String id;
  final String type;
  final String message;
  final DateTime timestamp;
  final String user;
  final String module;

  SystemLog({
    required this.id,
    required this.type,
    required this.message,
    required this.timestamp,
    required this.user,
    required this.module,
  });
}
