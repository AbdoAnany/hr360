import '../entities/TaskModel.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(String userId, int taskId);
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel?> getTask(String userId, int taskId);
  Future<void> updateTask(String userId, TaskModel task);
  Future<List<TaskModel>> getAllTasksByUserId(String userId);
}
