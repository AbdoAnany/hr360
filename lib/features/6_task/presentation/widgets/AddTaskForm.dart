import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:hr360/features/6_task/presentation/manager/task_cubit.dart';
import 'package:hr360/features/ProfileScreen/UI/manger/profile_cubit.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../di.dart';
import '../../../2_dash_border/presentation/pages/shared/constants/defaults.dart';
import '../../../ProfileScreen/UI/ProfileScreen.dart';
import '../../domain/entities/TaskModel.dart';
import 'EmployeeStats.dart';

class TaskForm extends StatefulWidget {
  final List<UserModel> userRefIds;
  final Function(TaskModel) onSubmit;
  final TaskModel? taskToEdit;
  final String submitButtonText;

  const TaskForm({
    Key? key,
    required this.userRefIds,
    required this.onSubmit,
    this.taskToEdit,
    this.submitButtonText = "Submit Task",
  }) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime? _fromDate;
  DateTime? _toDate;
  UserModel? _assignedTo;
  AttendanceState? _status;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.taskToEdit?.title ?? '');
    _descriptionController = TextEditingController(text: widget.taskToEdit?.description ?? '');

    // Parse dates if editing
    if (widget.taskToEdit != null) {
      _fromDate = DateTime.tryParse(widget.taskToEdit?.from ?? '');
      _toDate = DateTime.tryParse(widget.taskToEdit?.to ?? '');
      _status = getIt<TaskCubit>().states.firstWhere(
            (state) => state.status == widget.taskToEdit?.status,
        orElse: () => getIt<TaskCubit>().states.first,
      );
      _assignedTo = widget.userRefIds.firstWhere(
            (user) => user.email == widget.taskToEdit?.refID,
        orElse: () => widget.userRefIds.first,
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate
          ? _fromDate ?? DateTime.now()
          : _toDate ?? (_fromDate?.add(const Duration(days: 1)) ?? DateTime.now()),
      firstDate: isFromDate
          ? DateTime.now().subtract(const Duration(days: 365))
          : _fromDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
          // If to date is before from date, update it
          if (_toDate != null && _toDate!.isBefore(_fromDate!)) {
            _toDate = _fromDate!.add(const Duration(days: 1));
          }
        } else {
          _toDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                hintText: 'Task Title',
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the task title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              CustomInputField(
                hintText: 'Task Description',
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the task description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // From Date Picker
              InkWell(
                onTap: () => _selectDate(context, true),
                child: InputDecorator(
                  decoration: InputDecoration(
                    // labelText: 'From Date',
                    // errorText: _fromDate == null ? 'Please select start date' : null,
                    border: InputBorder.none,
                    // contentPadding: const EdgeInsets.all(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _fromDate != null ? _formatDate(_fromDate) : 'Select Start Date',
                        style: TextStyle(
                          color: _fromDate != null ? null : Colors.grey,
                        ),
                      ),
                      const Icon(Iconsax.calendar_1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // To Date Picker
              InkWell(
                onTap: () => _selectDate(context, false),
                child: InputDecorator(
                  decoration: InputDecoration(
                    // labelText: 'To Date',
                    // errorText: _toDate == null ? 'Please select end date' : null,
                    border: InputBorder.none,
                    // contentPadding: const EdgeInsets.all(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _toDate != null ? _formatDate(_toDate) : 'Select End Date',
                        style: TextStyle(
                          color: _toDate != null ? null : Colors.grey,
                        ),
                      ),
                       Icon(Iconsax.calendar_1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              widget.taskToEdit!=null?Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.taskToEdit!.assignedTo}",
                    style:AppStyle.heading3
              ))):
              DropdownButton<UserModel>(
                value: _assignedTo,underline: SizedBox(),isExpanded: true,

                // decoration: const InputDecoration(
                //   labelText: 'Assign To',
                //   border: InputBorder.none,
                //   contentPadding: EdgeInsets.all(12),
                // ),
                items: widget.userRefIds
                    .map((user) => DropdownMenuItem(
                  value: user,
                  child: Text("${user.firsName ?? ""} ${user.lastName ?? ""}"),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _assignedTo = value;
                  });
                },
                // validator: (value) {
                //   if (value == null) {
                //     return 'Please select a user';
                //   }
                //   return null;
                // },
              ),

              const SizedBox(height: 16),

              DropdownButton<AttendanceState>(
                value: _status,
                // decoration: const InputDecoration(
                //   border: InputBorder.none,
                //    contentPadding: EdgeInsets.all(0),
                // ),
                isExpanded: true,
                underline: SizedBox(),

                items: getIt<TaskCubit>().states
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: StatCard(state: AttendanceState(status: status.status,value:"-1",color: status.color)),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value;
                  });
                },
                // validator: (value) {
                //   if (value == null ) {
                //     return 'Please select a task status';
                //   }
                //   return null;
                // },
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding * 0.5,
                ),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _fromDate != null && _toDate != null) {
                      final task = TaskModel(
                        title: _titleController.text,
                        from: _formatDate(_fromDate),
                        to: _formatDate(_toDate),
                        createdByID: ProfileCubit().userProfile?.email,
                        description: _descriptionController.text,
                        refID: _assignedTo?.userId,
                        taskID: widget.taskToEdit?.taskID ??
                            Random().nextInt(10000).toString(),
                        assignedTo: "${_assignedTo?.firsName ?? ""} ${_assignedTo?.lastName ?? ""}",
                        status: _status?.status,
                      );
                      widget.onSubmit(task);
                    }
                  },
                  child: Text(
                    widget.submitButtonText,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
