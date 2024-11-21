import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:hr360/features/ProfileScreen/UI/manger/profile_cubit.dart';

import '../../../../../../di.dart';
import '../../../ProfileScreen/UI/ProfileScreen.dart';
import '../../domain/entities/TaskModel.dart';
import '../manager/task_cubit.dart';
import 'AddTaskForm.dart';

class EmployeeStats extends StatelessWidget {
  EmployeeStats({super.key, this.taskList = const []});
  List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 12, top: 12),
            child:   InkWell(
            onTap: () {
              context.read<TaskCubit>().updateTaskFilter('Total Tasks');
            },   borderRadius: BorderRadius.circular(8),
            child:   StatCard(state:
          AttendanceState(status: 'Total Tasks', color: Colors.grey, value:taskList.length.toString())),
        )),
        ...context.read<TaskCubit>().states.map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 12, top: 12),
                child: InkWell(
                onTap: () {
                  context.read<TaskCubit>().updateTaskFilter(e.status);
                },
                borderRadius: BorderRadius.circular(8),
                child: StatCard(
                    state: AttendanceState(
                      status: e.status,
                      value: taskList
                          .where((ee) => ee.status == e.status)
                          .length
                          .toString(),
                      color: e.color,
                    ),
                  ),
                ),
              ),
            ),
        Spacer(),
        CustomButton(
          onPressed: () {
            showAddTaskDialog(
              taskToEdit: null,
              context: context,
              onSubmit: (TaskModel task) {
                context.read<TaskCubit>().addTask(task);
              },
            );
          },
          text: "New Task",
        ),
        SizedBox(width: 8,)
      ],
    );
  }
}

Future<void> showAddTaskDialog({
  required BuildContext context,
  TaskModel? taskToEdit,
  required Function(TaskModel task) onSubmit,
}) async {
  List<UserModel> userRefIds = await ProfileCubit().getAllUserProfileDate();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${taskToEdit == null ? "Add" : "Edit"} Task'),
        content: TaskForm(
          userRefIds: userRefIds,
          taskToEdit: taskToEdit,
          onSubmit: (TaskModel task) {
            Navigator.of(context).pop(); // Close the dialog
            onSubmit(task); // Pass the task back
          },
        ),
      );
    },
  );
}

class StatCard extends StatelessWidget {
  final AttendanceState? state;

  const StatCard({
    super.key,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 8, bottom: 12, top: 12),
      decoration:
          //state?.status!="Total Tasks"?null:
          BoxDecoration(
              color: state?.color?.withOpacity(.07),
              borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Text(
            "${state?.status} ${state?.value == "-1" ? "" : ": ${state?.value}"}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: state?.color,
            ),
          ),
        ],
      ),
    );
  }
}
