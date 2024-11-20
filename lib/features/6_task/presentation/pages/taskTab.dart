import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/6_task/presentation/manager/task_cubit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../di.dart';
import '../../../1_login/data/user_model.dart';
import '../../data/repositories/FirebaseTaskRepository.dart';
import '../../../ProfileScreen/UI/ProfileScreen.dart';
import '../../domain/entities/TaskModel.dart';
import '../widgets/EmployeeStats.dart';
import '../widgets/TaskCard.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key, this.userDetails});
  final UserModel? userDetails;
  @override
  Widget build(BuildContext context) {


    // taskSetUP();
    return BlocProvider(
        create: (context) =>getIt<TaskCubit>()..getAllTasksByUserId(userDetails?.userId),
        child: TaskList(
          userDetails: userDetails,
        ));
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key, this.userDetails});
  final UserModel? userDetails;

  @override
  Widget build(BuildContext context) {
  return  BlocBuilder<TaskCubit, TaskState>(
      // bloc: getIt<TaskCubit>(),
        builder: (context, state) {
          final taskCubit = context.read<TaskCubit>();
          return Column(
            children: [
              EmployeeStats(taskList: state is TaskLoaded ? taskCubit.tasks : []),
              Expanded(
                  child: state is TaskLoaded || state is TaskLoading
                      ? ListView.builder(
                      itemCount: state is TaskLoaded ? state.tasks.length : 8,
                      itemBuilder: (context, index) => Skeletonizer(
                          enabled: state is TaskLoading,
                          child: TaskCard(
                              taskItem: state is TaskLoaded
                                  ? state.tasks[index]
                                  : TaskModel.fromJson({
                                "taskID": "$index",
                                "status": taskCubit
                                    .states[
                                index % taskCubit.states.length]
                                    .status,
                                "assignedTo": "Admin",
                                "title": "Task $index"
                              }))))
                      : const Center(child: Text("No Tasks Available")))
            ],
          );
        });
  }
}


