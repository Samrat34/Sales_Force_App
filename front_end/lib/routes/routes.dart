import 'package:get/get.dart';
import 'package:sales_force_app/domain/controllers/task_controller.dart';
import 'package:sales_force_app/presentation/pages/add_task_page.dart';
import 'package:sales_force_app/presentation/pages/home_page.dart';

abstract class Routes {
  static const home = '/';
  static const addTask = '/add_task';
  static const taskDetail = '/task_detail';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.addTask, page: () => const AddTaskPage()),
    // GetPage(name: Routes.taskDetail, page: () => TaskDetailPage()),
  ];
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
