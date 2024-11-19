import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../app.dart';
import '../../../../../../core/utils/formatters/formatter.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../1_login/data/user_model.dart';
import '../../../../../4_user/presentation/manager/bloc/user_bloc.dart';
import '../../../../../4_user/presentation/manager/bloc/user_event.dart';
import '../../../../../4_user/presentation/manager/bloc/user_state.dart';
import '../../../../../ProfileScreen/UI/ProfileScreen.dart';

class AttendanceGridView extends StatefulWidget {
  const AttendanceGridView({Key? key}) : super(key: key);

  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> {
  EmployeeDataSource? employeeDataSource;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetAllUsers());

    // HomeCubit.get(context).getDataFromServer().then((_) {
    //   final users = context.read<HomeCubit>().state.users;
    //   employeeDataSource = EmployeeDataSource(employees: users);
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MaterialButton(
            padding: EdgeInsets.all(16),
            onPressed: () => showAddUserDialog(context),
            // child: const Text('Add USer'),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Icon(Icons.add),
                SizedBox(width: 8,),
                Text('Add USer'),
              ],),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersLoaded) {
              employeeDataSource = EmployeeDataSource(
                  employees: state.users); // update data source
            }
            return employeeDataSource == null
                ? const Center(child: CircularProgressIndicator())
                : SfDataGridTheme(
                    data: const SfDataGridThemeData(
                      gridLineColor: Colors.transparent,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: SfDataGrid(
                        source: employeeDataSource!,
                        checkboxColumnSettings:
                            DataGridCheckboxColumnSettings(),
                        rowHeight: 70,
                        selectionMode: SelectionMode.multiple,
                        columnWidthMode: ColumnWidthMode.fitByCellValue,
                        defaultColumnWidth: 120,
                        allowPullToRefresh: true,
                        columns: <GridColumn>[
                          GridColumn(
                              columnName: 'Num',
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              minimumWidth: 75,
                              label: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F5F5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      )),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text('#'))),
                          GridColumn(
                              columnName: 'ID',
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              label: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text('ID'))),
                          GridColumn(
                              columnName: 'Name',
                              width: 200,
                              columnWidthMode: ColumnWidthMode.fill,
                              label: Container(
                                  color: Color(0xffF5F5F5),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('Name'))),
                          GridColumn(
                              columnName: 'Roles',
                              label: Container(
                                  color: Color(0xffF5F5F5),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('Roles'))),
                          GridColumn(
                              columnName: 'State',
                              width: 90,
                              label: Container(
                                  color: Color(0xffF5F5F5),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('State'))),
                          GridColumn(
                              columnName: 'Gender',
                              width: 100,
                              label: Container(
                                  color: Color(0xffF5F5F5),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('Gender'))),
                          GridColumn(
                              columnName: 'Phone',
                              width: 200,
                              label: Container(
                                  color: Color(0xffF5F5F5),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('Phone'))),
                          GridColumn(
                              columnName: 'Birth_Date',
                              width: 120,
                              label: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text('Birth Date'))),
                          GridColumn(
                              columnName: 'Action',
                              columnWidthMode: ColumnWidthMode.fill,
                              label: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F5F5),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      )),
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const Text('Details'))),
                        ],
                      ),
                    ),
                  );
          }),
        ],
      ),
    );
  }
  void showAddUserDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController nationalIdController = TextEditingController();
    final TextEditingController birthDateController = TextEditingController();

    List<String> itemListState = ['active', 'inactive'];
    List<String> itemListRole = ['student', 'teacher', 'admin', 'parent', 'employee'];
    List<String> itemListGender = ['male', 'female'];

    InputDecoration inputDecoration({String? labelText}) => InputDecoration(
      hintText: labelText ?? '',
      fillColor: AppColor.white,
      labelStyle: TextStyle(color: AppColor.darkerGrey, fontSize: 14),
      hintStyle: TextStyle(color: AppColor.darkGrey, fontSize: 14),
      filled: true,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderPrimary.withOpacity(.2), width: .5)
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderPrimary.withOpacity(.2), width: .5)
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderPrimary, width: .5)
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<UserBloc>(),
        child: Builder(
          builder: (builderContext) {
            String gender = 'male';
            String state = 'active';
            String role = 'student';

            return AlertDialog(
              backgroundColor: AppColor.blueWhite,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              content: SizedBox(
                width: 600,
                height: 450,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: firstNameController,
                                textInputAction: TextInputAction.next,
                                decoration: inputDecoration(labelText: 'first name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: lastNameController,
                                textInputAction: TextInputAction.next,
                                decoration: inputDecoration(labelText: 'last name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Last Name Field

                      // Email Field
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration(labelText: 'email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter email';
                          }
                          return null;
                        },
                      ),
                      // Phone Field
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: phoneController,
                          textInputAction: TextInputAction.next,
                          decoration: inputDecoration(labelText: 'phone'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter phone';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Address Field
                      TextFormField(
                        controller: addressController,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration(labelText: 'address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter address';
                          }
                          return null;
                        },
                      ),
                      // National ID Field
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: nationalIdController,
                          textInputAction: TextInputAction.next,
                          decoration: inputDecoration(labelText: 'national id'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter national id';
                            }
                            return null;
                          },
                        ),
                      ),
                      TextFormField(
                        controller: birthDateController,
                        textInputAction: TextInputAction.next,
                        readOnly:
                        true, // Makes the field non-editable, so the date can only be picked
                        decoration: inputDecoration(labelText: 'birth date'),
                        onTap: () async {
                          // Shows a date picker when the field is tapped
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900), // Earliest date user can pick
                            lastDate: DateTime.now(), // Latest date user can pick
                          );

                          if (pickedDate != null) {
                            // Formats the picked date to a string and sets it to the controller
                            birthDateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter birth date';
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: StatefulBuilder(
                                  builder: (context, setState) => DropdownButtonFormField<String>(
                                    value: role,
                                    items: itemListRole.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style: TextStyle(color: AppColor.darkerGrey)),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() => role = newValue!);
                                    },
                                    decoration: inputDecoration(labelText: 'Role'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: StatefulBuilder(
                                    builder: (context, setState) => DropdownButtonFormField<String>(
                                      value: gender,
                                      items: itemListGender.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value, style: TextStyle(color: AppColor.darkerGrey)),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() => gender = newValue!);
                                      },
                                      decoration: inputDecoration(labelText: 'Gender'),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: StatefulBuilder(
                                  builder: (context, setState) => DropdownButtonFormField<String>(
                                    value: state,
                                    items: itemListState.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style: TextStyle(color: AppColor.darkerGrey)),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() => state = newValue!);
                                    },
                                    decoration: inputDecoration(labelText: 'State'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                MaterialButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                MaterialButton(
                  minWidth: 200,
                  child: const Text('Add User'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      builderContext.read<UserBloc>().add(
                        AddUser(
                          UserModel(
                            firsName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                            nationalId: nationalIdController.text,
                            gender: gender,
                            birthDate: birthDateController.text,
                            roles: role,
                            state: state,
                          ),
                        ),
                      );
                      Navigator.of(dialogContext).pop();
                      builderContext.read<UserBloc>().add(GetAllUsers());

                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({List<UserModel>? employees}) {
    _employees = List.generate(employees!.length, (i) {
      UserModel e = employees[i];
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'Num', value: i + 1),
        DataGridCell<String>(columnName: 'ID', value: e.userId??"-"),
        DataGridCell<String>(
          columnName: 'Name',
          value: "${e.firsName} ${e.lastName}",
        ),
        DataGridCell<String>(columnName: 'Roles', value: e.roles),
        DataGridCell<String>(columnName: 'State', value: e.state),
        DataGridCell<String>(columnName: 'Gender', value: e.gender),
        DataGridCell<String>(columnName: 'Phone', value: e.phone),
        DataGridCell<String>(
          columnName: 'Birth_Date',
          value: TFormatter.formatDate(DateTime.parse('2010-07-19')),
        ),
        DataGridCell<UserModel>(columnName: 'Action', value: e),
      ]);
    });
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: Row(
          children: [
            if (dataGridCell.columnName == "Name")
              Image.asset(
                "assets/weman.png",
                width: 70,
              ),
            dataGridCell.columnName == "State"
                ? Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: dataGridCell.value == "active"
                                ? Colors.green.withOpacity(.07)
                                : Colors.red.withOpacity(.07)),
                        child: Center(
                            child: Text(dataGridCell.value,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: dataGridCell.value == "active"
                                        ? Color(0xff40997E)
                                        : Color(0xffF93333))))))
                : dataGridCell.columnName == "Action"
                    ? Expanded(
                        child: InkWell(
                            onTap: () {
                              THelperFunctions.navigateToScreen(
                                context:  Get.context,
                                  ProfileScreen(
                                    userDetails: dataGridCell.value,
                                  )
                              );
                              // Navigator.push(
                              //    ,
                              //     MaterialPageRoute(
                              //         builder: (context) => ProfileScreen(
                              //               userDetails: dataGridCell.value,
                              //             )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.blueAccent,
                              ),
                            )),
                      )
                    : Expanded(
                        child:
                            Center(child: Text(dataGridCell.value.toString()))),
          ],
        ),
      );
    }).toList());
  }
}
