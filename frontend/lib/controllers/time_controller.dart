import 'package:get/get.dart';
import 'dart:async';

class TimeController extends GetxController {
  RxString currentTime = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime =
        '${now.hour % 12 == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'pm' : 'am'}';
    currentTime.value = formattedTime;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
