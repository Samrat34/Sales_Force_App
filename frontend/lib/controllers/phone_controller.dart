// ignore_for_file: unused_element

import 'package:Sales_Force_App/views/employee/profile_scree.dart';
import 'package:flutter/material.dart';

class _UserProfilePageState extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  // User phone
  String phone = "+880123456789";

  // Controller for phone field
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with default phone
    phoneController = TextEditingController(text: phone);
  }

  @override
  void dispose() {
    // Dispose the controller to free memory
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField("Phone", phoneController, true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  phone = phoneController.text; // save phone
                  print("Updated Phone: $phone");
                });
              },
              child: Text("Save Phone"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, bool enabled) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
