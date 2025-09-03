// ignore_for_file: deprecated_member_use

import 'package:sales_force_app/views/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2563EB), // blue-600
            Color(0xFF805AD5), // purple-600
            Color(0xFF1E40AF), // blue-800
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Top right circle
          Positioned(
            top: -64,
            right: -64,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: AppColors.white10,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom left circle
          Positioned(
            bottom: -48,
            left: -48,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.white10,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          Column(
            children: [
              // Top row with greeting and target
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning, Alex! 🌟',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ready to make today productive?',
                        style: TextStyle(
                          color: Color(0xFFBFDBFE), // blue-100
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Target section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Today's Target",
                        style: TextStyle(
                          color: Color(0xFFBFDBFE), // blue-100
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '₹12,000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Metrics grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetricItem('98', 'Visits'),
                  _buildMetricItem('₹245K', 'Sales'),
                  _buildMetricItem('94%', 'Efficiency'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFFBFDBFE), // blue-100
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
