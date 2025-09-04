import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? status,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }
}

class UserController extends GetxController {
  // User lists
  var allUsers = <User>[].obs;
  var filteredUsers = <User>[].obs;

  // UI states
  var isLoading = true.obs;
  var selectedFilter = 'all'.obs;
  var searchQuery = ''.obs;

  // Dashboard statistics - renamed to avoid conflict
  var totalUsersCount = 0.obs;
  var pendingApprovalsCount = 0.obs;
  var activeUsersCount = 0.obs;
  var suspendedUsersCount = 0.obs;

  var approvedUsers;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    allUsers.assignAll([
      User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          role: 'Sales Manager',
          status: 'approved'),
      User(
          id: '2',
          name: 'Jane Smith',
          email: 'jane@example.com',
          role: 'Sales Rep',
          status: 'pending'),
      User(
          id: '3',
          name: 'Robert Johnson',
          email: 'robert@example.com',
          role: 'Sales Rep',
          status: 'pending'),
      User(
          id: '4',
          name: 'Sarah Williams',
          email: 'sarah@example.com',
          role: 'Sales Rep',
          status: 'approved'),
      User(
          id: '5',
          name: 'Michael Brown',
          email: 'michael@example.com',
          role: 'Sales Manager',
          status: 'approved'),
    ]);

    filteredUsers.assignAll(allUsers);
    updateDashboardStats();
    isLoading.value = false;
  }

  // Update dashboard statistics
  void updateDashboardStats() {
    totalUsersCount.value = allUsers.length;
    pendingApprovalsCount.value =
        allUsers.where((user) => user.status == 'pending').length;
    activeUsersCount.value =
        allUsers.where((user) => user.status == 'approved').length;
    suspendedUsersCount.value =
        allUsers.where((user) => user.status == 'suspended').length;
  }

  // Filter methods
  void applyFilters() => _applyFilters();

  void filterUsers(String status) {
    selectedFilter.value = status;
    _applyFilters();
  }

  void searchUsers(String query) {
    searchQuery.value = query.toLowerCase();
    _applyFilters();
  }

  void _applyFilters() {
    var filtered = allUsers.where((user) {
      final matchesStatus =
          selectedFilter.value == 'all' || user.status == selectedFilter.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          user.name.toLowerCase().contains(searchQuery.value) ||
          user.email.toLowerCase().contains(searchQuery.value) ||
          user.role.toLowerCase().contains(searchQuery.value);
      return matchesStatus && matchesSearch;
    }).toList();

    filteredUsers.assignAll(filtered);
  }

  // User management methods
  void approveUser(String userId) {
    final index = allUsers.indexWhere((u) => u.id == userId);
    if (index != -1) {
      allUsers[index] = allUsers[index].copyWith(status: 'approved');
      _applyFilters();
      updateDashboardStats();

      Get.snackbar(
        'User Approved',
        '${allUsers[index].name} has been approved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void deleteUser(String userId) {
    final index = allUsers.indexWhere((u) => u.id == userId);
    if (index != -1) {
      final name = allUsers[index].name;
      allUsers.removeAt(index);
      _applyFilters();
      updateDashboardStats();

      Get.snackbar(
        'User Deleted',
        '$name has been deleted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void suspendUser(String userId) {
    final index = allUsers.indexWhere((u) => u.id == userId);
    if (index != -1) {
      allUsers[index] = allUsers[index].copyWith(status: 'suspended');
      _applyFilters();
      updateDashboardStats();

      Get.snackbar(
        'User Suspended',
        '${allUsers[index].name} has been suspended',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void reactivateUser(String userId) {
    final index = allUsers.indexWhere((u) => u.id == userId);
    if (index != -1) {
      allUsers[index] = allUsers[index].copyWith(status: 'approved');
      _applyFilters();
      updateDashboardStats();

      Get.snackbar(
        'User Reactivated',
        '${allUsers[index].name} has been reactivated',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void updateUserRole(String userId, String newRole) {
    final index = allUsers.indexWhere((u) => u.id == userId);
    if (index != -1) {
      allUsers[index] = allUsers[index].copyWith(role: newRole);
      _applyFilters();

      Get.snackbar(
        'Role Updated',
        '${allUsers[index].name}\'s role changed to $newRole',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  // Getter methods - renamed to avoid conflicts
  List<User> get pendingUsersList =>
      allUsers.where((u) => u.status == 'pending').toList();
  List<User> get approvedUsersList =>
      allUsers.where((u) => u.status == 'approved').toList();
  List<User> get suspendedUsersList =>
      allUsers.where((u) => u.status == 'suspended').toList();

  get pendingUsers => null;

  // Get users by status
  List<User> getUsersByStatus(String status) {
    return allUsers.where((user) => user.status == status).toList();
  }

  // Get user by ID
  User? getUserById(String userId) {
    try {
      return allUsers.firstWhere((user) => user.id == userId);
    } catch (e) {
      return null;
    }
  }

  // Get dashboard statistics for charts
  Map<String, int> getRoleDistribution() {
    final distribution = <String, int>{};

    for (var user in allUsers) {
      distribution[user.role] = (distribution[user.role] ?? 0) + 1;
    }

    return distribution;
  }

  // Export user data (simulated)
  Future<void> exportUserData() async {
    isLoading.value = true;
    // Simulate export process
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar(
      'Export Complete',
      'User data has been exported successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Send bulk notification (simulated)
  Future<void> sendBulkNotification(String message) async {
    isLoading.value = true;
    // Simulate sending process
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar(
      'Notification Sent',
      'Bulk notification sent to all users',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  // Get system metrics (simulated)
  Map<String, dynamic> getSystemMetrics() {
    return {
      'totalUsers': allUsers.length,
      'pendingApprovals': pendingUsersList.length,
      'activeUsers': approvedUsersList.length,
      'suspendedUsers': suspendedUsersList.length,
      'serverUptime': '99.8%',
      'responseTime': '120ms',
    };
  }

  // Add new user
  void addUser(User newUser) {
    allUsers.add(newUser);
    _applyFilters();
    updateDashboardStats();

    Get.snackbar(
      'User Added',
      '${newUser.name} has been added successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
