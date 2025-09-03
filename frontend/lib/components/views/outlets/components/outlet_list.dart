// components/views/outlets/components/outlet_list.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sales_Force_App/controllers/outlet_controller.dart';
import 'package:Sales_Force_App/models/outlet_model.dart';

class OutletList extends StatelessWidget {
  final OutletController controller;

  const OutletList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.filteredOutlets.isEmpty) {
        return const Center(
          child: Text(
            'No outlets found',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.filteredOutlets.length,
        itemBuilder: (context, index) {
          final outlet = controller.filteredOutlets[index];
          return OutletCard(outlet: outlet);
        },
      );
    });
  }
}

class OutletCard extends StatelessWidget {
  final Outlet outlet;

  const OutletCard({super.key, required this.outlet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Store info
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Store icon with gradient
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: _getGradientColors(outlet.category),
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.store,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Store details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      outlet.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color:
                                            _getCategoryColor(outlet.category)
                                                .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        _getCategoryLabel(outlet.category),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: _getCategoryColor(
                                              outlet.category),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  outlet.location,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // Stats grid
                                GridView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 3,
                                  ),
                                  children: [
                                    _buildStatItem(
                                        '💰 Sales: ₹${outlet.sales}K'),
                                    _buildStatItem(
                                        '💳 Credit: ₹${outlet.credit}K'),
                                    _buildStatItem(
                                        '📍 Distance: ${outlet.distance} km'),
                                    _buildStatItem(
                                        '📅 Next: ${outlet.nextVisit}'),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                // Progress bar
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: outlet.progress / 100,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: _getProgressGradient(
                                                    outlet.progress),
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${outlet.progress}%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Status indicator and navigation
                    Column(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _getStatusColor(outlet.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          icon: Icon(
                            Icons.navigation,
                            size: 16,
                            color: Colors.blue[600],
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(12),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                child: Text(
                                  'Visit Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 48,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF059669)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.phone,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey[100]!, Colors.grey[200]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey[600],
      ),
    );
  }

  List<Color> _getGradientColors(String category) {
    switch (category) {
      case 'A':
        return [const Color(0xFF10B981), const Color(0xFF059669)];
      case 'B':
        return [const Color(0xFF3B82F6), const Color(0xFF06B6D4)];
      case 'C':
        return [const Color(0xFFF59E0B), const Color(0xFFEA580C)];
      default:
        return [const Color(0xFF6B7280), const Color(0xFF374151)];
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'A':
        return const Color(0xFF059669);
      case 'B':
        return const Color(0xFF2563EB);
      case 'C':
        return const Color(0xFFD97706);
      default:
        return const Color(0xFF6B7280);
    }
  }

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'A':
        return 'Cat A';
      case 'B':
        return 'Cat B';
      case 'C':
        return 'Cat C';
      default:
        return 'Cat $category';
    }
  }

  List<Color> _getProgressGradient(int progress) {
    if (progress >= 90) {
      return [const Color(0xFF10B981), const Color(0xFF059669)];
    } else if (progress >= 80) {
      return [const Color(0xFFF59E0B), const Color(0xFFEA580C)];
    } else {
      return [const Color(0xFFEF4444), const Color(0xFFDC2626)];
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active':
        return const Color(0xFF10B981);
      case 'inactive':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }
}
