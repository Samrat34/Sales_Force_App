// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CompactActionButtonsGrid extends StatelessWidget {
  const CompactActionButtonsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.9,
      children: [
        _buildActionButton(
          icon: Icons.camera_alt,
          label: "Audit",
          gradientColors: const [Colors.purple, Colors.deepPurple],
        ),
        _buildActionButton(
          icon: Icons.inventory_2,
          label: "Inventory",
          gradientColors: const [Colors.orange, Colors.red],
        ),
        _buildActionButton(
          icon: Icons.local_shipping,
          label: "Delivery",
          gradientColors: const [Colors.blue, Colors.cyan],
        ),
        _buildActionButton(
          icon: Icons.credit_card,
          label: "Expenses",
          gradientColors: const [Colors.green, Colors.teal],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required List<Color> gradientColors,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, animationValue, child) {
          return Transform.translate(
            offset: Offset(0, -1 * animationValue),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withAlpha(
                        (gradientColors[0].alpha * 0.3 * animationValue)
                            .round()),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // Handle button tap
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
