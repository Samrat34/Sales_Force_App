import 'package:get/get.dart';
import 'package:Sales_Force_App/controllers/auth_controller.dart';
import 'package:Sales_Force_App/controllers/preloader_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreloaderController());
    Get.lazyPut(() => AuthController());
  }
}
