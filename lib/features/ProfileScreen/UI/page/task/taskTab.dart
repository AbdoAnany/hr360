import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/ProfileScreen/UI/page/task/cubit/task_cubit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../di.dart';
import '../../../../1_login/data/user_model.dart';
import '../../../data/repositories/FirebaseTaskRepository.dart';
import '../../ProfileScreen.dart';
import 'model/TaskModel.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key, this.userDetails});
  final UserModel? userDetails;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<TaskCubit>(),
        child: TaskList(
          userDetails: userDetails,
        ));
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key, this.userDetails});
  final UserModel? userDetails;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskCubit>().getAllTasksByUserId(widget.userDetails?.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
        // bloc: getIt<TaskCubit>(),
        builder: (context, state) => Column(
              children: [
                const EmployeeStats(),
                Expanded(
                    child: state is TaskLoaded || state is TaskLoading
                        ? ListView.builder(
                            itemCount:  state is TaskLoaded?  state.tasks.length: 8,
                            itemBuilder: (context, index) =>
                                Skeletonizer(
                                    enabled: state is TaskLoading,
                                    child: TaskCard(taskItem: state is TaskLoaded? state.tasks[index]
                                    :TaskModel.fromJson(
                                        {"taskID": "$index",
                                          "status":  getIt<TaskCubit>()
                                              .states[index % getIt<TaskCubit>().states.length].status,
                                          "assignedTo": "Admin",
                                          "title": "Task $index"})
                                    )))
                        : const Center(child: Text("No Tasks Available")))
              ],
            ));
  }
}

class TaskCard extends StatelessWidget {
  final TaskModel? taskItem;

  const TaskCard({super.key, this.taskItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: getIt<TaskCubit>()
          .states
          .firstWhere((e) => e.status == taskItem?.status)
          .color
          ?.withOpacity(.07),
      color: getIt<TaskCubit>()
          .states
          .firstWhere((e) => e.status == taskItem?.status)
          .color
          ?.withOpacity(.07),
      shadowColor: getIt<TaskCubit>()
          .states
          .firstWhere((e) => e.status == taskItem?.status)
          .color
          ?.withOpacity(.07),
      child: ListTile(
        leading: Icon(
          Iconsax.activity5,
          color: getIt<TaskCubit>()
              .states
              .firstWhere((e) => e.status == taskItem?.status)
              .color,
        ),
        title: Text(taskItem?.title ?? ""),
        subtitle: Text("${taskItem?.from} - ${taskItem?.to}"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            Text(taskItem?.assignedTo ?? ""),
          ],
        ),
      ),
    );
  }
}
