// components/outlets/components/header.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/outlet_controller.dart';

class OutletHeader extends StatelessWidget {
  final OutletController controller;

  const OutletHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Outlets',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Obx(() => Text(
                '${controller.filteredOutlets.length} outlets',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              )),
        ],
      ),
    );
  }
}
