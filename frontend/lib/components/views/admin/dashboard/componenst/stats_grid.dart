import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height *
            0.4, // Limit height to 40% of screen
      ),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.2, // Adjusted aspect ratio
        children: [
          _buildStatCard(
            icon: Icons.tablet,
            gradientColors: const [Colors.green, Colors.teal],
            change: "+5%",
            title: "Achievement",
            value: "82%",
          ),
          _buildStatCard(
            icon: Icons.trending_up,
            gradientColors: const [Colors.blue, Colors.cyan],
            change: "+2%",
            title: "Growth",
            value: "+15%",
          ),
          _buildStatCard(
            icon: Icons.access_time,
            gradientColors: const [Colors.purple, Colors.deepPurple],
            change: "+3%",
            title: "Efficiency",
            value: "94%",
          ),
          _buildStatCard(
            icon: Icons.attach_money,
            gradientColors: const [Colors.orange, Colors.red],
            change: "+8%",
            title: "Collections",
            value: "₹45K",
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required List<Color> gradientColors,
    required String change,
    required String title,
    required String value,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 120, // Limit card height
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, animationValue, child) {
            return Transform.translate(
              offset: Offset(0, -2 * animationValue),
              child: child,
            );
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade100, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10), // Reduced padding
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Better space distribution
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32, // Slightly smaller
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: gradientColors[0].withAlpha(
                                  (gradientColors[0].alpha * 0.3).round()),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(icon,
                            color: Colors.white, size: 16), // Smaller icon
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          change,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14, // Slightly smaller
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
