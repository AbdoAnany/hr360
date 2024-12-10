import '../../domain/entities/TaskModel.dart';
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
