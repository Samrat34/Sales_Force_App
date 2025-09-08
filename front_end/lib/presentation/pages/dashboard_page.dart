// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/domain/view_models/auth_viewmodel.dart';
import 'package:sales_force_app/presentation/widgets/admin_dashboard.dart';

class DashboardPage extends StatelessWidget {
  final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AdminDashboard()));
  }
}
