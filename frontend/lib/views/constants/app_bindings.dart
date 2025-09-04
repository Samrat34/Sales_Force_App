// app_bindings.dart
import 'package:get/get.dart';
import 'package:sales_force_app/controllers/login_controller.dart';
import 'package:sales_force_app/controllers/time_controller.dart';
import 'package:sales_force_app/controllers/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut<TimeController>(() => TimeController());

    // Permanent instances
    Get.put(LoginController(), permanent: true);
    Get.put(UserController(), permanent: true);
  }
}
