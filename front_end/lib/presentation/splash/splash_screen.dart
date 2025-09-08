import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create a curved animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the animation
    _controller.forward();

    // Navigate to login screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => LoginScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0066CC),
                        Color(0xFF00BFFF),
                        Color(0xFF00CED1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(Icons.shield, color: Colors.white, size: 60),
                ),

                SizedBox(height: 30),

                // App title with animation
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'SalesForce CRM',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Tagline with animation
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'Enterprise Multi-Tier Platform',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Loading indicator
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),

                SizedBox(height: 20),

                // Loading text
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),

                SizedBox(height: 80),

                // Version info at bottom
                Positioned(
                  bottom: 30,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Column(
                      children: [
                        Text(
                          'SalesForce CRM v3.0.0 - Enterprise Edition',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '© 2024 SalesForce Solutions',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
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
