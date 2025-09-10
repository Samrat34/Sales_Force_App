import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data
  var userName = 'Managing Director'.obs;
  var userRole = 'Executive Management'.obs;
  var userEmail = 'md@salesforce.com'.obs;
  var userId = 'super-admin-001'.obs;
  var territory = 'Not Assigned'.obs;

  // Stats
  var visits = 156.obs;
  var sales = '₹2.4L'.obs;
  var target = '94%'.obs;

  // Methods
  void logout() {
    // Implement logout logic
    Get.back();
  }

  void editProfile() {
    // Navigate to edit profile
    Get.snackbar('Edit Profile', 'Edit profile functionality');
  }

  void openSuperAdminPanel() {
    // Navigate to super admin panel
    Get.snackbar('Super Admin Panel', 'Opening super admin panel');
  }

  void openPermissionTest() {
    // Navigate to permission test
    Get.snackbar('Permission Test', 'Opening permission test');
  }

  void openUserManagement() {
    // Navigate to user management
    Get.snackbar('User Management', 'Opening user management');
  }

  void openSettings() {
    // Navigate to settings
    Get.snackbar('Settings', 'Opening settings');
  }

  void openNotifications() {
    // Navigate to notifications
    Get.snackbar('Notifications', 'Opening notifications');
  }

  void changePassword() {
    // Navigate to change password
    Get.snackbar('Change Password', 'Opening change password');
  }

  void openHelpSupport() {
    // Navigate to help & support
    Get.snackbar('Help & Support', 'Opening help & support');
  }
}
