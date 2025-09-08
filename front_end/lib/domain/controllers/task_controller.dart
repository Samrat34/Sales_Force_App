import 'package:get/get.dart';
import 'package:sales_force_app/(data/models/task_model.dart';
import 'package:sales_force_app/(data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository _repository = TaskRepository();
  final tasks = <Task>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      isLoading.value = true;
      final fetchedTasks = await _repository.getTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tasks');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _repository.addTask(task);
      tasks.add(task);
      Get.back();
      Get.snackbar('Success', 'Task added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add task');
    }
  }

  Future<void> toggleTaskCompletion(String id) async {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        final updatedTask = tasks[taskIndex].copyWith(
          isCompleted: !tasks[taskIndex].isCompleted,
        );
        await _repository.updateTask(updatedTask);
        tasks[taskIndex] = updatedTask;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _repository.deleteTask(id);
      tasks.removeWhere((task) => task.id == id);
      Get.snackbar('Success', 'Task deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task');
    }
  }
}
