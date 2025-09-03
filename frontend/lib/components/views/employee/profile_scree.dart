import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // User data
  String userName = "John Doe";
  String email = "johndoe@example.com";
  String role = "Sales Manager";
  String phone = "+880123456789";
  File? profileImageFile;
  String profileImage = "https://i.pravatar.cc/300?img=3";

  bool isEditing = false;

  // Controllers for text fields
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController roleController;
  late TextEditingController phoneController;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: userName);
    emailController = TextEditingController(text: email);
    roleController = TextEditingController(text: role);
    phoneController = TextEditingController(text: phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    roleController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImageFile = File(image.path);
      });
    }
  }

  Future<void> pickCameraImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
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
                  pickCameraImage();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.green),
                title: Text("Choose from Gallery"),
                onTap: () {
                  pickImage();
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[700]!, Colors.blue[500]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(isEditing ? Icons.save : Icons.edit,
                    color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      userName = nameController.text;
                      email = emailController.text;
                      role = roleController.text;
                      phone = phoneController.text;
                      Get.snackbar(
                        "Profile Updated",
                        "Your changes have been saved",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    }
                    isEditing = !isEditing;
                  });
                },
              ),
            ],
          ),

          // Profile Content
          SliverToBoxAdapter(
            child: Column(
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
                    child:
                        Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),

                // User Info
                Container(
                  transform: Matrix4.translationValues(0, -60, 0),
                  child: Column(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // Info Cards
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    children: [
                      // Personal Info Card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              _buildInfoItem(
                                  "Full Name", nameController, Icons.person),
                              _buildInfoItem(
                                  "Email", emailController, Icons.email),
                              _buildInfoItem(
                                  "Role", roleController, Icons.work),
                              _buildInfoItem(
                                  "Phone", phoneController, Icons.phone),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Social Accounts
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.link, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(
                                    "Social Accounts",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              _buildSocialItem(FontAwesomeIcons.facebook,
                                  "Facebook", "john.doe"),
                              _buildSocialItem(FontAwesomeIcons.twitter,
                                  "Twitter", "@johndoe"),
                              _buildSocialItem(FontAwesomeIcons.linkedin,
                                  "LinkedIn", "John Doe"),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Recent Activity
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.history, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(
                                    "Recent Activity",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              _buildActivityItem("Logged in", "2 hours ago"),
                              _buildActivityItem(
                                  "Profile updated", "1 day ago"),
                              _buildActivityItem(
                                  "Task completed", "3 days ago"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
            child: isEditing
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

  Widget _buildSocialItem(IconData icon, String platform, String username) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          FaIcon(icon, color: Colors.blue, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String activity, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 137, 248),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_circle, color: Colors.blue, size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
