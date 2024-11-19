import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr360/features/ProfileScreen/UI/ProfileScreen.dart';

import '../../../1_login/data/user_model.dart';
import '../../UI/page/task/model/TaskModel.dart';
import '../../UI/page/task/taskTab.dart';
import '../../domain/repositories/TaskRepository.dart';
 import '../../domain/repositories/TaskRepository.dart';
import '../service/FirebaseTaskService.dart';
class FirebaseTaskRepository implements TaskRepository {
  final FirebaseTaskService taskService;

  FirebaseTaskRepository(this.taskService);

  @override
  Future<void> addTask(TaskModel task) {
    return taskService.addTask( task);
  }

  @override
  Future<void> deleteTask(String userId, int taskId) {
    return taskService.deleteTask(userId, taskId);
  }

  @override
  Future<List<TaskModel>> getAllTasks() {
    return taskService.getAllTasks();
  }

  @override
  Future<TaskModel?> getTask(String userId, int taskId) {
    return taskService.getTask(userId, taskId);
  }

  @override
  Future<void> updateTask(String userId, TaskModel task) {
    return taskService.updateTask(userId, task);
  }

  @override
  Future<List<TaskModel>> getAllTasksByUserId(String? userId) {
    return taskService.getAllTasksByUserId(userId);
  }
}
