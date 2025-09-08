import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class SplashViewModel extends GetxController {
  final AuthRepository _repository = AuthRepository();

  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ); // Show preloader for 3 seconds

    final user = await _repository.getCurrentUser();

    if (user != null) {
      Get.offNamed('/dashboard');
    } else {
      Get.offNamed('/login');
    }
  }
}
