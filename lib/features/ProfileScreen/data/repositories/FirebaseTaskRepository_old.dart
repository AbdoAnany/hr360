// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hr360/features/ProfileScreen/UI/ProfileScreen.dart';
//
// import '../../../1_login/data/user_model.dart';
// import '../../domain/repositories/TaskRepository.dart';
// // import '../../domain/repositories/TaskRepository.dart';
//
// class FirebaseUserRepository implements TaskRepository {
//   final CollectionReference usersRef =
//   FirebaseFirestore.instance.collection('task');
//
//   @override
//   Future<void> addTask(TaskModel task) async {
//     try {
//       final taskRef = usersRef.doc(task.refID.toString());
//       await taskRef.update({
//         'tasks': FieldValue.arrayUnion([task.toJson()])
//       });
//     } catch (e) {
//       print("Error adding task: $e");
//     }
//   }
//
//   @override
//   Future<void> deleteTask(int taskId) async {
//     try {
//       final tasksQuery = await usersRef
//           .where('tasks', arrayContains: {'taskID': taskId})
//           .get();
//       for (var doc in tasksQuery.docs) {
//         await doc.reference.update({
//           'tasks': FieldValue.arrayRemove([{'taskID': taskId}])
//         });
//       }
//       print("Task with ID $taskId deleted successfully.");
//     } catch (e) {
//       print("Error deleting task: $e");
//     }
//   }
//
//   @override
//   Future<List<TaskModel>> getAllTasks() async {
//     try {
//       final querySnapshot = await usersRef.get();
//       List<TaskModel> tasks = [];
//       for (var doc in querySnapshot.docs) {
//         final data = doc.data() as Map<String, dynamic>;
//         final taskList = data['tasks'] as List<dynamic>? ?? [];
//         tasks.addAll(
//           taskList.map((task) => TaskModel.fromJson(task as Map<String, dynamic>)),
//         );
//       }
//       return tasks;
//     } catch (e) {
//       print("Error retrieving all tasks: $e");
//       return [];
//     }
//   }
//
//   @override
//   Future<TaskModel?> getTask(int taskId) async {
//     try {
//       final tasksQuery = await usersRef
//           .where('tasks', arrayContains: {'taskID': taskId})
//           .get();
//       if (tasksQuery.docs.isNotEmpty) {
//         final taskData = tasksQuery.docs.first.data() as Map<String, dynamic>;
//         final taskList = taskData['tasks'] as List<dynamic>;
//         final taskMap = taskList.firstWhere((task) => task['taskID'] == taskId);
//         return TaskModel.fromJson(taskMap as Map<String, dynamic>);
//       }
//       return null;
//     } catch (e) {
//       print("Error retrieving task with ID $taskId: $e");
//       return null;
//     }
//   }
//
//   @override
//   Future<void> updateTask(TaskModel task) async {
//     try {
//       final tasksQuery = await usersRef
//           .where('tasks', arrayContains: {'taskID': task.taskID})
//           .get();
//       for (var doc in tasksQuery.docs) {
//         final taskList = (doc.data() as Map<String, dynamic>)['tasks'] as List<dynamic>;
//         final updatedTasks = taskList.map((existingTask) {
//           if (existingTask['taskID'] == task.taskID) {
//             return task.toJson();
//           }
//           return existingTask;
//         }).toList();
//         await doc.reference.update({'tasks': updatedTasks});
//       }
//       print("Task with ID ${task.taskID} updated successfully.");
//     } catch (e) {
//       print("Error updating task: $e");
//     }
//   }
//
//   @override
//   Future<List<TaskModel>> getAllTasksByUSerID(userId) async {
//     try {
//       final userDoc = await usersRef.doc(userId.toString()).get();
//       if (userDoc.exists) {
//         final data = userDoc.data() as Map<String, dynamic>;
//         final taskList = data['tasks'] as List<dynamic>? ?? [];
//         return taskList
//             .map((task) => TaskModel.fromJson(task as Map<String, dynamic>))
//             .toList();
//       }
//       return [];
//     } catch (e) {
//       print("Error retrieving tasks for user ID $userId: $e");
//       return [];
//     }
//   }
//
//   @override
//   Future<List<TaskModel>> getAllTasksByUserId(String userId) {
//     // TODO: implement getAllTasksByUserId
//     throw UnimplementedError();
//   }
// }
