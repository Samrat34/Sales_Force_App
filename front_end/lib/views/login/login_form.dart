import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/presentation/widgets/loading_overlay.dart';
import '../../domain/view_models/auth_viewmodel.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final AuthViewModel viewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.15), // Fixed withOpacity
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.3),
        ), // Fixed withOpacity
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2), // Fixed withOpacity
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Email field
          TextField(
            onChanged: viewModel.setEmail,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(
                255,
                255,
                255,
                0.2,
              ), // Fixed withOpacity
              prefixIcon: const Icon(Icons.person, color: Colors.white70),
              hintText: 'Enter your email',
              hintStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xFF00CED1),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Password field
          TextField(
            onChanged: viewModel.setPassword,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(
                255,
                255,
                255,
                0.2,
              ), // Fixed withOpacity
              prefixIcon: const Icon(Icons.lock, color: Colors.white70),
              hintText: 'Enter your password',
              hintStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xFF00CED1),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Login button
          Obx(
            () => LoadingOverlay(
              isLoading: viewModel.isLoading.value,
              child: ElevatedButton(
                onPressed: viewModel.login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00CED1),
                  foregroundColor: const Color(0xFF0066CC),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  shadowColor: const Color.fromRGBO(
                    0,
                    0,
                    0,
                    0.3,
                  ), // Fixed withOpacity
                ),
                child: const Text(
                  'Sign In to Dashboard',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
          Obx(
            () => Text(
              viewModel.errorMessage.value,
              style: TextStyle(
                color: viewModel.errorMessage.value.contains('successful')
                    ? Colors.green[200]
                    : Colors.yellow[200],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
