import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../6_task/domain/entities/TaskModel.dart';
// import '../../domain/repositories/TaskRepository.dart';
class FirebaseTaskService {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('task');

  Future<void> addTask(TaskModel task) async {
    try {
      final taskRef = usersRef.doc(task.refID.toString());
      await taskRef.set({
        'tasks': FieldValue.arrayUnion([task.toJson()])
      }, SetOptions(merge: true)); // Merges if document exists; creates otherwise.
      print("Task added successfully.");
    } catch (e) {
      print("Error adding task: $e");
    }
  }


  Future<void> deleteTask(String userId, int taskId) async {
    final userDoc = await usersRef.doc(userId).get();
    if (userDoc.exists) {
      final data = userDoc.data() as Map<String, dynamic>;
      final tasks = (data['tasks'] as List).cast<Map<String, dynamic>>();
      final updatedTasks =
          tasks.where((task) => task['taskID'] != taskId).toList();
      await usersRef.doc(userId).update({'tasks': updatedTasks});
    }
  }

  Future<List<TaskModel>> getAllTasks() async {
    final querySnapshot = await usersRef.get();
    List<TaskModel> tasks = [];
    for (var doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final taskList = (data['tasks'] as List<dynamic>? ?? [])
          .map((task) => TaskModel.fromJson(task as Map<String, dynamic>));
      tasks.addAll(taskList);
    }
    return tasks;
  }

  Future<TaskModel?> getTask(String userId, int taskId) async {
    final userDoc = await usersRef.doc(userId).get();
    if (userDoc.exists) {
      final data = userDoc.data() as Map<String, dynamic>;
      final taskList = (data['tasks'] as List<dynamic>? ?? []);
      final task = taskList
          .firstWhere((task) => task['taskID'] == taskId, orElse: () => null);
      if (task != null) return TaskModel.fromJson(task as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> updateTask(String userId, TaskModel task) async {
    final userDoc = await usersRef.doc(userId).get();
    if (userDoc.exists) {
      final data = userDoc.data() as Map<String, dynamic>;
      final taskList = (data['tasks'] as List<dynamic>).map((existingTask) {
        if (existingTask['taskID'] == task.taskID) {
          return task.toJson();
        }
        return existingTask;
      }).toList();
      await usersRef.doc(userId).update({'tasks': taskList});
    }
  }

  Future<List<TaskModel>> getAllTasksByUserId(String? userId) async {
    if(userId==null)return [];
    final userDoc = await usersRef.doc(userId).get();
    if (userDoc.exists) {
      final data = userDoc.data() as Map<String, dynamic>;
      final taskList = (data['tasks'] as List<dynamic>? ?? [])
          .map((task) => TaskModel.fromJson(task as Map<String, dynamic>))
          .toList();
      return taskList;
    }
    return [];
  }
}
