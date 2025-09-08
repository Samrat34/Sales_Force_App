import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/view_models/auth_viewmodel.dart';
import '../../../domain/models/user_role.dart';
import 'widgets/admin_drawer.dart';
import 'widgets/dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('SalesForce CRM'),
        backgroundColor: const Color(0xFF0066CC),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          Obx(
            () => authViewModel.currentUser.value != null
                ? CircleAvatar(
                    backgroundImage:
                        authViewModel.currentUser.value!.profileImage != null
                        ? NetworkImage(
                            authViewModel.currentUser.value!.profileImage!,
                          )
                        : null,
                    child: authViewModel.currentUser.value!.profileImage == null
                        ? Text(authViewModel.currentUser.value!.name[0])
                        : null,
                  )
                : const SizedBox(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(child: DashboardContent()),
    );
  }
}
