import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 1),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.lock_open,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        const Text(
          'Sign in to continue your journey',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
