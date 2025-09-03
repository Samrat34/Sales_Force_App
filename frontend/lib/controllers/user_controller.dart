// user_controller.dart
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
}

class UserController extends GetxController {
  var allUsers = <User>[].obs;
  var filteredUsers = <User>[].obs;
  var isLoading = true.obs;
  var selectedFilter = 'all'.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    // Mock data
    allUsers.assignAll([
      User(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
        role: 'Sales Manager',
        status: 'approved',
      ),
      User(
        id: '2',
        name: 'Jane Smith',
        email: 'jane@example.com',
        role: 'Sales Rep',
        status: 'pending',
      ),
      User(
        id: '3',
        name: 'Robert Johnson',
        email: 'robert@example.com',
        role: 'Sales Rep',
        status: 'pending',
      ),
      User(
        id: '4',
        name: 'Sarah Williams',
        email: 'sarah@example.com',
        role: 'Sales Rep',
        status: 'approved',
      ),
      User(
        id: '5',
        name: 'Michael Brown',
        email: 'michael@example.com',
        role: 'Sales Manager',
        status: 'approved',
      ),
    ]);

    filteredUsers.assignAll(allUsers);
    isLoading.value = false;
  }

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
          user.email.toLowerCase().contains(searchQuery.value);
      return matchesStatus && matchesSearch;
    }).toList();

    filteredUsers.assignAll(filtered);
  }

  void approveUser(String userId) {
    final userIndex = allUsers.indexWhere((user) => user.id == userId);
    if (userIndex != -1) {
      allUsers[userIndex] = User(
        id: allUsers[userIndex].id,
        name: allUsers[userIndex].name,
        email: allUsers[userIndex].email,
        role: allUsers[userIndex].role,
        status: 'approved',
      );
      _applyFilters();
      Get.snackbar(
        'User Approved',
        '${allUsers[userIndex].name} has been approved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void deleteUser(String userId) {
    final userIndex = allUsers.indexWhere((user) => user.id == userId);
    if (userIndex != -1) {
      final userName = allUsers[userIndex].name;
      allUsers.removeAt(userIndex);
      _applyFilters();
      Get.snackbar(
        'User Deleted',
        '$userName has been deleted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  List<User> get pendingUsers =>
      allUsers.where((user) => user.status == 'pending').toList();

  List<User> get approvedUsers =>
      allUsers.where((user) => user.status == 'approved').toList();
}
