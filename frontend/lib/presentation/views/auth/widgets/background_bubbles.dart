import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundBubbles extends StatelessWidget {
  const BackgroundBubbles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.3,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 80,
              child: Container(
                width: 288.w,
                height: 288.w,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 160,
              right: 80,
              child: Container(
                width: 288.w,
                height: 288.w,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade200,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -32,
              left: 160,
              child: Container(
                width: 288.w,
                height: 288.w,
                decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
