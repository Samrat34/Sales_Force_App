import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false, // This hides the scrollbar
        ),
        child: Container(
          color: Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo and app name
                        Expanded(
                          child: Row(
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SalesForce CRM',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Field Sales Management',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.8),
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
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
                            padding: EdgeInsets.zero,
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
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Sales Rep',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Territory Manager',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
              // Menu sections
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main section
                    _buildSectionHeader('Main'),
                    SizedBox(height: 8),
                    _buildMenuItem(Icons.home, 'Dashboard', isSelected: true),
                    _buildMenuItem(Icons.store, 'Outlets'),
                    _buildMenuItem(Icons.shopping_bag, 'Orders'),
                    _buildMenuItem(Icons.bar_chart, 'Reports'),
                    SizedBox(height: 24),

                    // Field Operations section
                    _buildSectionHeader('Field Operations'),
                    SizedBox(height: 8),
                    _buildMenuItem(Icons.access_time, 'Attendance & Check-in'),
                    _buildMenuItem(Icons.calendar_today, 'Daily Planning'),
                    _buildMenuItem(Icons.location_on, 'GPS Tracking'),
                    _buildMenuItem(Icons.store, 'Outlet Management'),
                    SizedBox(height: 24),

                    // Sales & Orders section
                    _buildSectionHeader('Sales & Orders'),
                    SizedBox(height: 8),
                    _buildMenuItem(Icons.shopping_bag, 'Sales Orders'),
                    _buildMenuItem(
                        Icons.local_shipping, 'Delivery & Logistics'),
                    _buildMenuItem(Icons.assignment_return, 'Sales Returns'),
                    _buildMenuItem(Icons.discount, 'Discounts & Promotions'),
                    SizedBox(height: 24),

                    // Inventory & Assets section
                    _buildSectionHeader('Inventory & Assets'),
                    SizedBox(height: 8),
                    _buildMenuItem(Icons.inventory, 'Inventory Management'),
                    _buildMenuItem(Icons.security, 'Asset Management'),
                    _buildMenuItem(Icons.photo_camera, 'Product Visibility'),
                    SizedBox(height: 24),

                    // Financial & Compliance section
                    _buildSectionHeader('Financial & Compliance'),
                    SizedBox(height: 8),
                    _buildMenuItem(
                        Icons.attach_money, 'Travel Allowance (TA/DA)'),
                    _buildMenuItem(Icons.payment, 'Payment Collection'),
                    _buildMenuItem(
                        Icons.gps_fixed, 'Compliance & Geo-tracking'),
                    SizedBox(height: 24),

                    // Engagement & Analytics section
                    _buildSectionHeader('Engagement & Analytics'),
                    SizedBox(height: 8),
                    _buildMenuItem(Icons.description, 'Surveys & Campaigns'),
                    _buildMenuItem(Icons.menu_book, 'Learning & Training'),
                    _buildMenuItem(Icons.trending_up, 'Performance Monitoring'),
                  ],
                ),
              ),
            ],
          ),
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
      {bool isSelected = false}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFEFF6FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {},
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
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Color(0xFF2563EB) : Colors.grey[700],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
