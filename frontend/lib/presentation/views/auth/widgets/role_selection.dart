import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cms_system/presentation/controllers/auth_controller.dart';
import 'package:cms_system/presentation/views/auth/widgets/role_card.dart';
import 'package:cms_system/presentation/views/auth/widgets/access_hierarchy.dart';

class RoleSelection extends GetView<AuthController> {
  const RoleSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Access Roles',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0c4a6e), // blue-900
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Click any role below for demo access',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF075985), // blue-800
          ),
        ),
        SizedBox(height: 16.h),

        // Role cards
        const RoleCard(
          title: 'Super Admin (MD)',
          subtitle: 'Managing Director',
          description: 'Full system access & control',
          gradient: LinearGradient(
            colors: [
              Color(0xFFfacc15), // yellow-400
              Color(0xFFf97316), // orange-500
              Color(0xFFef4444), // red-500
            ],
          ),
          icon: Icons.workspace_premium,
          iconColor: Color(0xFFca8a04), // yellow-600
        ),

        SizedBox(height: 12.h),

        const RoleCard(
          title: 'Company Employee',
          subtitle: 'John Doe',
          description: 'Company operations & management',
          gradient: LinearGradient(
            colors: [
              Color(0xFF60a5fa), // blue-400
              Color(0xFF3b82f6), // blue-500
              Color(0xFF2563eb), // blue-600
            ],
          ),
          icon: Icons.work_outline,
          iconColor: Color(0xFF1d4ed8), // blue-700
        ),

        SizedBox(height: 12.h),

        const RoleCard(
          title: 'Client',
          subtitle: 'ABC Distributors Ltd',
          description: 'Client business management',
          gradient: LinearGradient(
            colors: [
              Color(0xFF4ade80), // green-400
              Color(0xFF22c55e), // green-500
              Color(0xFF16a34a), // green-600
            ],
          ),
          icon: Icons.business,
          iconColor: Color(0xFF15803d), // green-700
        ),

        SizedBox(height: 12.h),

        const RoleCard(
          title: 'Client Employee',
          subtitle: 'Sarah Wilson',
          description: 'Field operations under client',
          gradient: LinearGradient(
            colors: [
              Color(0xFF818cf8), // indigo-400
              Color(0xFF6366f1), // indigo-500
              Color(0xFF4f46e5), // indigo-600
            ],
          ),
          icon: Icons.people_outline,
          iconColor: Color(0xFF4338ca), // indigo-700
        ),

        SizedBox(height: 12.h),

        const RoleCard(
          title: 'Customer',
          subtitle: 'XYZ Retail Store',
          description: 'Service access & orders',
          gradient: LinearGradient(
            colors: [
              Color(0xFFc084fc), // purple-400
              Color(0xFFa855f7), // purple-500
              Color(0xFF9333ea), // purple-600
            ],
          ),
          icon: Icons.shopping_bag_outlined,
          iconColor: Color(0xFF7e22ce), // purple-700
        ),

        SizedBox(height: 16.h),

        // Access hierarchy
        const AccessHierarchy(),
      ],
    );
  }
}
