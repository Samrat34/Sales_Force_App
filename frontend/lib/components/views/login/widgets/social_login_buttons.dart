import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white10,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: IconButton(
          icon: Icon(icon, color: Colors.white), onPressed: onPressed),
    );
  }
}
