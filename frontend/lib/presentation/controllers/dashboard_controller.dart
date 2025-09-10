import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cms_system/data/models/alert_model.dart';

class DashboardController extends GetxController {
  // Initialize all variables with default values
  final userName = 'Managing Director'.obs;
  final currentDate = '10/9/2025'.obs;
  final currentTime = '10:12 am'.obs;
  final systemStatus = 'Operational'.obs;

  final stats = {
    'revenue': {'value': '₹0.8L', 'change': '+12.5%'},
    'clients': {'value': '1', 'change': '+8.2%'},
    'users': {'value': '5', 'change': '+15.3%'},
    'outlets': {'value': '4', 'change': '+5.7%'},
  }.obs;

  final networkOverview = {
    'companyStaff': 1,
    'fieldStaff': 1,
    'activeOutlets': 3,
  }.obs;

  // Initialize with empty list and populate in onInit
  final alerts = <AlertModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeAlerts();
  }

  void _initializeAlerts() {
    alerts.addAll([
      AlertModel(
        title: 'Server Maintenance',
        message: 'Scheduled maintenance on Jan 20, 2025 at 2:00 AM',
        time: '2 hours ago',
        color: Colors.orange,
      ),
      AlertModel(
        title: 'New Feature Release',
        message: 'Advanced analytics module is now available',
        time: '4 hours ago',
        color: Colors.blue,
      ),
      AlertModel(
        title: 'Backup Completed',
        message: 'Daily system backup completed successfully',
        time: '6 hours ago',
        color: Colors.green,
      ),
    ]);
  }
}
