// components/outlets/components/status_bar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/outlet_controller.dart';

class StatusBar extends StatelessWidget {
  final OutletController controller;

  const StatusBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.blue[50],
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Showing ${controller.filteredOutlets.length} outlets',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Category: ${controller.selectedCategory.value}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
            ],
          )),
    );
  }
}
