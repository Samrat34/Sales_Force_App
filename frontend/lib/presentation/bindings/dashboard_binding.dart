import 'package:get/get.dart';
import 'package:cms_system/presentation/controllers/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), permanent: true);
  }
}
