// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final Color color;

  const MetricCard({
    required this.title,
    required this.value,
    required this.change,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                change,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_upward,
                size: 14,
                color: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
