import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/login_controller.dart';

class PersonalInfoCard extends StatefulWidget {
  final bool isEditing;

  const PersonalInfoCard({super.key, required this.isEditing});

  @override
  State<PersonalInfoCard> createState() => _PersonalInfoCardState();
}

class _PersonalInfoCardState extends State<PersonalInfoCard> {
  final LoginController _loginController = Get.find<LoginController>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final user = _loginController.user;
    _nameController = TextEditingController(text: user?.name ?? "John Doe");
    _emailController =
        TextEditingController(text: user?.email ?? "user@example.com");
    _roleController = TextEditingController(text: user?.role ?? "User");
    _phoneController = TextEditingController(text: "+880123456789");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildInfoItem(
      String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          SizedBox(width: 12),
          Expanded(
            child: widget.isEditing
                ? TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: label,
                      border: UnderlineInputBorder(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        controller.text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildInfoItem("Full Name", _nameController, Icons.person),
              _buildInfoItem("Email", _emailController, Icons.email),
              _buildInfoItem("Role", _roleController, Icons.work),
              _buildInfoItem("Phone", _phoneController, Icons.phone),
            ],
          ),
        ),
      ),
    );
  }
}
