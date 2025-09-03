import 'package:flutter/material.dart';

class TodaysPlanCard extends StatelessWidget {
  const TodaysPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(255, 255, 255, 01),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Plan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle view all action
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Plan Items
          _buildPlanItem(
            color: Colors.grey.shade300,
            title: "Super Mart Express",
            time: "10:00 AM • visit",
            priority: "high",
            priorityColor: Colors.red,
          ),
          _buildPlanItem(
            color: Colors.green.shade400,
            title: "City General Store",
            time: "11:30 AM • visit",
            priority: "medium",
            priorityColor: Colors.orange,
          ),
          _buildPlanItem(
            color: Colors.blue.shade400,
            title: "Metro Pharmacy",
            time: "02:00 PM • audit",
            priority: "high",
            priorityColor: Colors.red,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPlanItem({
    required Color color,
    required String title,
    required String time,
    required String priority,
    required Color priorityColor,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: Colors.grey.shade50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getPriorityBackgroundColor(priority),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              priority,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _getPriorityTextColor(priority),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityBackgroundColor(String priority) {
    switch (priority) {
      case "high":
        return Colors.red.shade100;
      case "medium":
        return Colors.yellow.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getPriorityTextColor(String priority) {
    switch (priority) {
      case "high":
        return Colors.red.shade600;
      case "medium":
        return Colors.yellow.shade700;
      default:
        return Colors.grey.shade600;
    }
  }
}
