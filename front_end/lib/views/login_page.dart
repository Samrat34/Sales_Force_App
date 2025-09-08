// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SalesForce CRM',
      theme: ThemeData(
        primaryColor: const Color(0xFF0066CC),
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: const Color(0xFF00CED1),
          backgroundColor: const Color(0xFFF0F8FF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F8FF),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF0066CC),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF0066CC),
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Color(0xFF2F4F4F)),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF0066CC),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0066CC),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00CED1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0066CC), width: 2),
          ),
        ),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  void _login() {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    // Simulate login process
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          _errorMessage = 'Please enter email and password';
        } else {
          _errorMessage = 'Login successful!';
          // Navigate to dashboard in a real app
        }
      });
    });
  }

  void _loginWithRole(String role) {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    // Simulate login process with role
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Logged in as $role';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0066CC), // Deep blue
              Color(0xFF0088CC), // Medium blue
              Color(0xFF00BCD4), // Bright aqua
            ],
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
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
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
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white70,
                          ),
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
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
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
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF00CED1,
                                ), // Aqua color
                                foregroundColor: const Color(
                                  0xFF0066CC,
                                ), // Deep blue text
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              child: const Text(
                                'Sign In to Dashboard',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                      const SizedBox(height: 10),
                      Text(
                        _errorMessage,
                        style: TextStyle(
                          color: _errorMessage.contains('successful')
                              ? Colors.green[200]
                              : Colors.yellow[200],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

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

                // Role buttons with blue-aqua gradients
                RoleButton(
                  role: 'Super Admin (MD)',
                  subtitle: 'Managing Director',
                  description: 'Full system access & control',
                  gradient: [
                    const Color(0xFF0066CC),
                    const Color(0xFF0088CC),
                    const Color(0xFF00BCD4),
                  ],
                  onTap: () => _loginWithRole('Super Admin'),
                ),

                const SizedBox(height: 15),
                RoleButton(
                  role: 'Company Employee',
                  subtitle: 'John Doe',
                  description: 'Company operations & management',
                  gradient: [
                    const Color(0xFF0077B6),
                    const Color(0xFF0096C7),
                    const Color(0xFF00B4D8),
                  ],
                  onTap: () => _loginWithRole('Company Employee'),
                ),

                const SizedBox(height: 15),
                RoleButton(
                  role: 'Client',
                  subtitle: 'ABC Distributors Ltd',
                  description: 'Client business management',
                  gradient: [
                    const Color(0xFF0088CC),
                    const Color(0xFF00A8E8),
                    const Color(0xFF48CAE4),
                  ],
                  onTap: () => _loginWithRole('Client'),
                ),

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

class RoleButton extends StatelessWidget {
  final String role;
  final String subtitle;
  final String description;
  final List<Color> gradient;
  final VoidCallback onTap;

  const RoleButton({
    required this.role,
    required this.subtitle,
    required this.description,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.person_outline, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}
