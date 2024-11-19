part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

class TaskInitial extends TaskState {}
class TaskAdd extends TaskState {}
class TaskUpdate extends TaskState {}
class TaskDelete extends TaskState {}
class TaskGet extends TaskState {}
class TaskGetAll extends TaskState {}
class TaskGetAllById extends TaskState {}
class TaskLoading extends TaskState {}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;

  TaskLoaded(this.tasks);
}
class TaskSuccess extends TaskState {
  final String message;

  TaskSuccess(this.message);
}