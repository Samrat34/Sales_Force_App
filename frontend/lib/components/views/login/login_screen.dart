import 'package:Sales_Force_App/components/views/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4D48B4),
              Color(0xFF2023ED),
              Color(0xFF1700E6),
              Color(0xFF0047ED),
              Color(0xFF745CFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.lock_open, size: 50, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sign in to continue your journey',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 30),
                LoginForm(), // form component
              ],
            ),
          ),
        ),
      ),
    );
  }
}
