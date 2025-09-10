import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  var activeMenuItem = 'Dashboard'.obs;

  void setActiveMenuItem(String item) {
    activeMenuItem.value = item;
    // Close drawer after selection
    Get.back();
  }
}
