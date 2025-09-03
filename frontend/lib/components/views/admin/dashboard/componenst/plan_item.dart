import 'package:flutter/material.dart';

class PlanItem extends StatelessWidget {
  final String title;
  final String time;
  final String priority;

  const PlanItem({
    required this.title,
    required this.time,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (priority) {
      case 'high':
        priorityColor = Color(0xFFEF4444);
        break;
      case 'medium':
        priorityColor = Color(0xFFF59E0B);
        break;
      default:
        priorityColor = Color(0xFF10B981);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: priorityColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
