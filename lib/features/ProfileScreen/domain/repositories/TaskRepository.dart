import '../../../1_login/data/user_model.dart';
import '../../UI/ProfileScreen.dart';
import '../../UI/page/task/model/TaskModel.dart';
import '../../UI/page/task/taskTab.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(String userId, int taskId);
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel?> getTask(String userId, int taskId);
  Future<void> updateTask(String userId, TaskModel task);
  Future<List<TaskModel>> getAllTasksByUserId(String userId);
}
