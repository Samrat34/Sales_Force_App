import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the status bar height
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Add a SizedBox with statusBarHeight to push content below the notification bar
            SizedBox(height: statusBarHeight),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Header with gradient background
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF805AD5)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Top row with logo and close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Logo and app name
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.store,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SalesForce CRM',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Field Sales Management',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Close button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.close,
                                    color: Colors.white, size: 20),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // User profile
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Sales Rep',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Territory Manager',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.8),
                                      fontSize: 14,
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
                  // Menu sections
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main section
                        _buildSectionHeader('dashboard'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.home,
                          'Dashboard',
                          isSelected: true,
                          onTap: () {
                            Navigator.pop(context);
                            Get.toNamed(
                                '/superadmin-dashboard'); // 👈 go to superadmin dashboard
                          },
                        ),
                        _buildMenuItem(
                          Icons.store,
                          'Outlets',
                          onTap: () {
                            Navigator.pop(context);
                            Get.toNamed('/outlets');
                          },
                        ),
                        _buildMenuItem(
                          Icons.shopping_bag,
                          'Orders',
                          onTap: () {
                            Navigator.pop(context);
                            // Add orders navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.bar_chart,
                          'Reports',
                          onTap: () {
                            Navigator.pop(context);
                            // Add reports navigation here
                          },
                        ),
                        SizedBox(height: 24),

                        // Field Operations section
                        _buildSectionHeader('Field Operations'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.access_time,
                          'Attendance & Check-in',
                          onTap: () {
                            Navigator.pop(context);
                            // Add attendance navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.calendar_today,
                          'Daily Planning',
                          onTap: () {
                            Navigator.pop(context);
                            // Add daily planning navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.location_on,
                          'GPS Tracking',
                          onTap: () {
                            Navigator.pop(context);
                            // Add GPS tracking navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.store,
                          'Outlet Management',
                          onTap: () {
                            Navigator.pop(context);
                            Get.toNamed('/outlets');
                          },
                        ),
                        SizedBox(height: 24),

                        // Sales & Orders section
                        _buildSectionHeader('Sales & Orders'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.shopping_bag,
                          'Sales Orders',
                          onTap: () {
                            Navigator.pop(context);
                            // Add sales orders navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.local_shipping,
                          'Delivery & Logistics',
                          onTap: () {
                            Navigator.pop(context);
                            // Add delivery navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.assignment_return,
                          'Sales Returns',
                          onTap: () {
                            Navigator.pop(context);
                            // Add sales returns navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.discount,
                          'Discounts & Promotions',
                          onTap: () {
                            Navigator.pop(context);
                            // Add discounts navigation here
                          },
                        ),
                        SizedBox(height: 24),

                        // Inventory & Assets section
                        _buildSectionHeader('Inventory & Assets'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.inventory,
                          'Inventory Management',
                          onTap: () {
                            Navigator.pop(context);
                            // Add inventory navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.security,
                          'Asset Management',
                          onTap: () {
                            Navigator.pop(context);
                            // Add assets navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.photo_camera,
                          'Product Visibility',
                          onTap: () {
                            Navigator.pop(context);
                            // Add product visibility navigation here
                          },
                        ),
                        SizedBox(height: 24),

                        // Financial & Compliance section
                        _buildSectionHeader('Financial & Compliance'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.attach_money,
                          'Travel Allowance (TA/DA)',
                          onTap: () {
                            Navigator.pop(context);
                            // Add travel allowance navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.payment,
                          'Payment Collection',
                          onTap: () {
                            Navigator.pop(context);
                            // Add payment collection navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.gps_fixed,
                          'Compliance & Geo-tracking',
                          onTap: () {
                            Navigator.pop(context);
                            // Add compliance navigation here
                          },
                        ),
                        SizedBox(height: 24),

                        // Engagement & Analytics section
                        _buildSectionHeader('Engagement & Analytics'),
                        SizedBox(height: 8),
                        _buildMenuItem(
                          Icons.description,
                          'Surveys & Campaigns',
                          onTap: () {
                            Navigator.pop(context);
                            // Add surveys navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.menu_book,
                          'Learning & Training',
                          onTap: () {
                            Navigator.pop(context);
                            // Add learning navigation here
                          },
                        ),
                        _buildMenuItem(
                          Icons.trending_up,
                          'Performance Monitoring',
                          onTap: () {
                            Navigator.pop(context);
                            // Add performance navigation here
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey[600],
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {bool isSelected = false, VoidCallback? onTap}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFEFF6FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Color(0xFF2563EB) : Colors.grey[700],
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Color(0xFF2563EB) : Colors.grey[700],
              ),
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(left: 8),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF2563EB),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
