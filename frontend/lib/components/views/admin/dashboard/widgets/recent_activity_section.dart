// import 'package:Sales_Force_App/components/views/admin/dashboard/widgets/activity_item.dart';
import 'package:Sales_Force_App/components/views/admin/dashboard/componenst/activity_item.dart';
import 'package:flutter/material.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(255, 255, 255, 0.7),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ActivityItem(
            title: 'Completed visit at Super Mart',
            time: '2 hours ago',
            isCompleted: true,
          ),
          ActivityItem(
            title: 'New inventory update received',
            time: '3 hours ago',
            isCompleted: false,
          ),
          ActivityItem(
            title: 'Collection received ₹15,000',
            time: 'Yesterday',
            isCompleted: false,
          ),
          ActivityItem(
            title: 'Low stock alert: Energy Drink',
            time: 'Yesterday',
            isCompleted: false,
          ),
        ],
      ),
    );
  }
}
