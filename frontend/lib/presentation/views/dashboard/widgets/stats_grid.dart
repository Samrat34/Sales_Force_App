import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cms_system/presentation/views/dashboard/widgets/stats_card.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      childAspectRatio: 1.1,
      children: const [
        StatsCard(
          title: 'Total Revenue',
          value: '₹0.8L',
          change: '+12.5%',
          icon: Icons.currency_rupee,
          iconColor: Colors.green,
        ),
        StatsCard(
          title: 'Active Clients',
          value: '1',
          change: '+8.2%',
          icon: Icons.business,
          iconColor: Colors.blue,
        ),
        StatsCard(
          title: 'Total Users',
          value: '5',
          change: '+15.3%',
          icon: Icons.people,
          iconColor: Colors.purple,
        ),
        StatsCard(
          title: 'Network Outlets',
          value: '4',
          change: '+5.7%',
          icon: Icons.public,
          iconColor: Colors.orange,
        ),
      ],
    );
  }
}
