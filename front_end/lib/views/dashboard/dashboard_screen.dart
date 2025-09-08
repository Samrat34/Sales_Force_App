import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/view_models/auth_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();

    // Add a print to confirm we reached the dashboard
    print('🎯 SUCCESS: Reached Dashboard Screen!');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - SalesForce CRM'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print('Logout pressed');
              authViewModel.logout();
            },
          ),
        ],
      ),
      body: Container(
        color:
            Colors.green[100], // Distinct color to confirm we're on dashboard
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.dashboard, size: 64, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                'DASHBOARD LOADED SUCCESSFULLY!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Text(
                  'Welcome: ${authViewModel.currentUser.value?.name ?? "No User"}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  'Role: ${authViewModel.currentUser.value?.role.name ?? "No Role"}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print('Manual logout pressed');
                  authViewModel.logout();
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
