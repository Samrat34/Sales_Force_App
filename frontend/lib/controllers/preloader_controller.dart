import 'package:Sales_Force_App/views/login/login_screen.dart';
import 'package:get/get.dart';

class PreloaderController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate loading process
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
      Get.off(() => LoginScreen());
    });
  }
}
