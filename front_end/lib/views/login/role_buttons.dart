import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/view_models/auth_viewmodel.dart';
import '../../domain/models/user_role.dart';

class RoleButtons extends StatelessWidget {
  const RoleButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();

    return Column(
      children: [
        // Super Admin Button
        ElevatedButton(
          onPressed: () => authViewModel.loginWithRole(UserRole.superAdmin),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome), // Using a different icon
              SizedBox(width: 10),
              Text('Super Admin Login'),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Admin Employee Button
        ElevatedButton(
          onPressed: () => authViewModel.loginWithRole(UserRole.adminEmployee),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4169E1),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.business_center),
              SizedBox(width: 10),
              Text('Admin Employee Login'),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Client Button
        ElevatedButton(
          onPressed: () => authViewModel.loginWithRole(UserRole.client),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF32CD32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text('Client Login'),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Client Employee Button
        ElevatedButton(
          onPressed: () => authViewModel.loginWithRole(UserRole.clientEmployee),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9370DB),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people),
              SizedBox(width: 10),
              Text('Client Employee Login'),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Customer Button
        ElevatedButton(
          onPressed: () => authViewModel.loginWithRole(UserRole.customer),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6347),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 10),
              Text('Customer Login'),
            ],
          ),
        ),
      ],
    );
  }
}
