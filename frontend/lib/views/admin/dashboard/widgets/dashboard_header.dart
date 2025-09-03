import 'package:Sales_Force_App/controllers/time_controller.dart';
import 'package:Sales_Force_App/views/employee/profile_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sales_Force_App/controllers/auth_controller.dart';

enum MenuAction { profile, settings, logout }

class DashboardHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardHeader({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final TimeController timeController = Get.put(TimeController());

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(218, 214, 214, 0.58)),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.098),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row with menu, title, and action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: Menu button and title
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF805AD5)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => scaffoldKey.currentState?.openDrawer(),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF805AD5)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds),
                    child: Text(
                      'SalesForce CRM',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              // Right side: Notification and profile buttons
              Row(
                children: [
                  // Notification
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            color: Color.fromRGBO(0, 62, 162, 1),
                            size: 20,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '12',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  // Profile
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF805AD5)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: PopupMenuButton<MenuAction>(
                      offset: Offset(0, 50),
                      onSelected: (value) {
                        switch (value) {
                          case MenuAction.profile:
                            Get.to(() => UserProfilePage());
                            break;
                          case MenuAction.settings:
                            break;
                          case MenuAction.logout:
                            authController.logout();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.profile,
                          child: Row(
                            children: [
                              Icon(Icons.person,
                                  size: 20, color: Colors.grey[700]),
                              SizedBox(width: 8),
                              Text('Profile'),
                            ],
                          ),
                        ),
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.settings,
                          child: Row(
                            children: [
                              Icon(Icons.settings,
                                  size: 20, color: Colors.grey[700]),
                              SizedBox(width: 8),
                              Text('Settings'),
                            ],
                          ),
                        ),
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.logout,
                          child: Row(
                            children: [
                              Icon(Icons.logout,
                                  size: 20, color: Colors.grey[700]),
                              SizedBox(width: 8),
                              Text('Logout'),
                            ],
                          ),
                        ),
                      ],
                      child: Icon(Icons.person_outline,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),

          // Status bar with drop shadows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Available status
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(163, 249, 222, 0.69),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Available',
                          style: TextStyle(
                            color: Color(0xFF065F46),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  // Visits status
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(197, 221, 251, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.store, size: 14, color: Color(0xFF2563EB)),
                        SizedBox(width: 6),
                        Text(
                          '0 visits',
                          style: TextStyle(
                            color: Color(0xFF1E40AF),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Time with drop shadow (real-time)
              Obx(() => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(193, 221, 253, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      timeController.currentTime.value,
                      style: TextStyle(
                        color: Color(0xFF5B21B6),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
