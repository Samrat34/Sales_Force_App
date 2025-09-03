import 'package:Sales_Force_App/views/constants/app_drawer.dart';
import 'package:Sales_Force_App/views/outlets/components/outlet_list.dart';
import 'package:Sales_Force_App/views/outlets/components/search_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sales_Force_App/controllers/outlet_controller.dart';

class OutletScreen extends StatelessWidget {
  final OutletController outletController = Get.put(OutletController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header with menu button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Outlets',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Search and Filter Section
            const SearchSection(),

            // Category Grid - Fixed with limited height
            SizedBox(
              height: 120, // Fixed height to prevent overflow
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                  children: [
                    _buildCategoryCard(
                      gradientColors: const [
                        Color(0xFF10B981),
                        Color(0xFF059669),
                      ],
                      icon: Icons.star,
                      count: 2,
                      label: 'Category A',
                    ),
                    _buildCategoryCard(
                      gradientColors: const [
                        Color(0xFF3B82F6),
                        Color(0xFF06B6D4),
                      ],
                      icon: Icons.store,
                      count: 1,
                      label: 'Category B',
                    ),
                    _buildCategoryCard(
                      gradientColors: const [
                        Color(0xFFF59E0B),
                        Color(0xFFEA580C),
                      ],
                      icon: Icons.inventory,
                      count: 1,
                      label: 'Category C',
                    ),
                    _buildCategoryCard(
                      gradientColors: const [
                        Color(0xFFEF4444),
                        Color(0xFFDB2777),
                      ],
                      icon: Icons.warning,
                      count: 1,
                      label: 'Overdue',
                    ),
                  ],
                ),
              ),
            ),

            // Outlet List - Expanded to take remaining space
            Expanded(
              child: OutletList(controller: outletController),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required List<Color> gradientColors,
    required IconData icon,
    required int count,
    required String label,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('$label tapped');
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, size: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
