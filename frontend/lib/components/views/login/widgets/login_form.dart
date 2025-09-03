import 'package:Sales_Force_App/components/views/admin/dashboard/super_admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sales_Force_App/controllers/auth_controller.dart';
// import 'package:Sales_Force_App/components/views/core/dashboard_screen.dart'; // <-- Add this

class LoginForm extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RxString selectedRole = 'super_admin'.obs; // default role selection

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: !_authController.isPasswordVisible.value,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    _authController.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white70,
                  ),
                  onPressed: () => _authController.togglePasswordVisibility(),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),

            // Role selection dropdown
            DropdownButtonFormField<String>(
              value: selectedRole.value,
              dropdownColor: Colors.black54,
              decoration: InputDecoration(
                labelText: 'Role',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              style: TextStyle(color: Colors.white),
              items: [
                DropdownMenuItem(
                    value: 'super_admin', child: Text('Super Admin')),
                DropdownMenuItem(value: 'client', child: Text('Client')),
                DropdownMenuItem(value: 'employee', child: Text('Employee')),
                DropdownMenuItem(value: 'customer', child: Text('Customer')),
              ],
              onChanged: (value) {
                if (value != null) selectedRole.value = value;
              },
            ),

            SizedBox(height: 20),
            _authController.isLoading.value
                ? CircularProgressIndicator(color: Colors.white)
                : ElevatedButton(
                    onPressed: () async {
                      bool success = await _authController.login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );

                      if (success) {
                        // Check role matches selection
                        if (_authController.getUserRole() !=
                            selectedRole.value) {
                          Get.snackbar('Error',
                              'Selected role does not match your account role');
                          _authController.logout();
                        } else {
                          Get.offAll(() => SuperAdminDashboard());
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16)),
                  ),
          ],
        ),
      ),
    );
  }
}
