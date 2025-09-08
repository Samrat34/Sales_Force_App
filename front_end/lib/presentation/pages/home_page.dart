// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_force_app/routes/routes.dart';
import '../../domain/controllers/task_controller.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _taskController.loadTasks,
          ),
        ],
      ),
      body: Obx(() {
        if (_taskController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_taskController.tasks.isEmpty) {
          return const Center(
            child: Text(
              'No tasks yet!\nAdd a new task to get started.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: _taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = _taskController.tasks[index];
            return TaskTile(
              task: task,
              onToggle: () => _taskController.toggleTaskCompletion(task.id),
              onDelete: () => _taskController.deleteTask(task.id),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addTask),
        child: const Icon(Icons.add),
      ),
    );
  }
}
