import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../di.dart';
import '../../domain/entities/TaskModel.dart';
import '../manager/task_cubit.dart';
import 'EmployeeStats.dart';

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
        title: Text(taskItem?.title ?? "",style: AppStyle.heading3,),


        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("${taskItem?.description}",style: AppStyle.bodyText,),
            Text("${taskItem?.from} - ${taskItem?.to}",style: AppStyle.font14Gray400,),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showAddTaskDialog(
                  taskToEdit: taskItem,
                  context: context, onSubmit: (TaskModel task) {
                    print(task.toJson());
                  context.read<TaskCubit>().updateTask(task);

                },);
                // getIt<TaskCubit>().getAllTasksByUserId();
              },child:  Icon(Iconsax.edit,color: AppColor.darkerGrey,),
            ),

            Text(taskItem?.assignedTo ?? ""),
          ],
        ),
      ),
    );
  }
}
