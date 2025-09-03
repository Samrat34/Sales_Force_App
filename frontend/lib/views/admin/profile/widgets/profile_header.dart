import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sales_force_app/controllers/login_controller.dart';

class ProfileHeader extends StatefulWidget {
  final bool isEditing;
  final Function(bool) onEditToggle;

  const ProfileHeader({
    super.key,
    required this.isEditing,
    required this.onEditToggle,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final LoginController _loginController = Get.find<LoginController>();
  final ImagePicker _picker = ImagePicker();
  File? profileImageFile;

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        profileImageFile = File(image.path);
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Change Profile Photo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.blue),
                title: Text("Take Photo"),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.green),
                title: Text("Choose from Gallery"),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.red),
                title: Text("Cancel"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _loginController.user;
    final profileImage = "https://i.pravatar.cc/300?img=3";

    return Column(
      children: [
        // Profile Image
        Container(
          transform: Matrix4.translationValues(0, -50, 0),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 56,
              backgroundImage: profileImageFile != null
                  ? FileImage(profileImageFile!)
                  : NetworkImage(profileImage) as ImageProvider,
            ),
          ),
        ),

        // Edit Photo Button
        Container(
          transform: Matrix4.translationValues(0, -70, 0),
          child: FloatingActionButton.small(
            onPressed: _showImagePickerOptions,
            backgroundColor: Colors.blue,
            child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
          ),
        ),

        // User Info
        Container(
          transform: Matrix4.translationValues(0, -60, 0),
          child: Column(
            children: [
              Text(
                user?.name ?? "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                user?.role ?? "User",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Text(
                user?.email ?? "user@example.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
