import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repositories/FirebaseTaskRepository.dart';
import '../../../ProfileScreen.dart';
import '../model/TaskModel.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskService) : super(TaskInitial());
  FirebaseTaskRepository taskService ;

  static TaskCubit get(context) => BlocProvider.of(context);
  updateState(TaskState taskState) => emit(taskState);

  List<TaskModel> tasksFilter = [];
  List<TaskModel> tasks = [];
  final List<AttendanceState> states = [
    AttendanceState(status: 'Total Tasks', color: Colors.grey, value: "0"),
    AttendanceState(status: 'Not Started', color: Colors.orange, value: "0"),
    AttendanceState(status: 'Ongoing', color: Colors.blue, value: "0"),
    AttendanceState(status: 'Completed', color: Colors.green, value: "0"),
    AttendanceState(status: 'Overdue', color: Colors.red, value: "0"),
    // Add more tasks as needed
  ];


  getAllTasks() async {
    emit(TaskLoading());
    try {
      tasks =  await taskService.getAllTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError('Failed to load tasks: $e'));
    }
  }

  addTask(TaskModel task) async {
    emit(TaskLoading());
    try {
      await taskService.addTask(task);
      emit(TaskSuccess('Added task successfully'));
    } catch (e) {
      emit(TaskError('Failed to add task: $e'));
    }
  }

  deleteTask({required int taskId, required String userID}) async {
    emit(TaskLoading());
    try {
      await taskService.deleteTask(userID,taskId);
      emit(TaskSuccess('Deleted task successfully'));
    } catch (e) {
      emit(TaskError('Failed to delete task: $e'));
    }
  }

  updateTask(TaskModel task) async {
    emit(TaskLoading());
    try {
      await taskService.updateTask(task.refID!,task);
      emit(TaskSuccess('Updated task successfully'));
    } catch (e) {
      emit(TaskError('Failed to update task: $e'));
    }
  }

  getTask(String userId, int taskId) async {
    emit(TaskLoading());
    try {
      final task = await taskService.getTask(userId, taskId);
      emit(TaskLoaded([task!]));
    } catch (e) {
      emit(TaskError('Failed to get task: $e'));
    }
  }

  getAllTasksByUserId(String? userId) async {
    print('getAllTasksByUserId userId: $userId');
    emit(TaskLoading());
    try {
      tasks =  await taskService.getAllTasksByUserId(userId);
      await Future.delayed(const Duration(seconds: 5));
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError('Failed to get tasks: $e'));
    }
  }
  updateTaskFilter(List<TaskModel> tasks) {
    tasksFilter = tasks;
    emit(TaskLoaded(tasksFilter));
  }




}
