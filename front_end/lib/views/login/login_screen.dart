import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/view_models/auth_viewmodel.dart';
import 'login_form.dart';
import 'role_buttons.dart';

class LoginScreen extends StatelessWidget {
  final AuthViewModel viewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0066CC), Color(0xFF0088CC), Color(0xFF00BCD4)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Logo and title
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0066CC),
                        Color(0xFF00BFFF),
                        Color(0xFF00CED1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shield,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  'SalesForce CRM',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),
                Text(
                  'Multi-tier Access Portal',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                const SizedBox(height: 40),

                // Login form
                LoginForm(),

                const SizedBox(height: 30),

                Text(
                  'Quick Access Roles',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  'Click any role below for demo access',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                const SizedBox(height: 20),

                // Role buttons
                const RoleButtons(),

                const SizedBox(height: 30),

                Text(
                  'SalesForce CRM v3.0.0 - Enterprise Edition',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '© 2024 SalesForce Solutions • Secure Multi-Tenant Platform',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
