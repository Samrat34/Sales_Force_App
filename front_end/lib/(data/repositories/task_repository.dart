import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class TaskRepository {
  final String _tasksKey = 'tasks';

  Future<List<Task>> getTasks() async {
    await SharedPreferences.getInstance();

    // For simplicity, we'll return an empty list
    // In a real app, you would parse the JSON string
    return [];
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    // Convert tasks to JSON and save
    // For now, we'll just save an empty array
    await prefs.setString(_tasksKey, '[]');
  }

  Future<void> addTask(Task task) async {
    final tasks = await getTasks();
    tasks.add(task);
    await saveTasks(tasks);
  }

  Future<void> updateTask(Task updatedTask) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await saveTasks(tasks);
    }
  }

  Future<void> deleteTask(String id) async {
    final tasks = await getTasks();
    tasks.removeWhere((task) => task.id == id);
    await saveTasks(tasks);
  }
}
