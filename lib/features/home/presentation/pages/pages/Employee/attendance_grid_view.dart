import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/routing/app_router.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
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

import 'package:flutter/material.dart';
import 'package:synatix/synatix.dart'; // Assuming Synatix or similar responsive library is used
import 'package:intl/intl.dart';

class AttendanceGridView extends StatefulWidget {
  const AttendanceGridView({Key? key}) : super(key: key);

  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> {
  EmployeeDataSource? employeeDataSource;
  InputDecoration inputDecoration({String? labelText}) {
    return InputDecoration(
      hintText: labelText,
      fillColor: AppColor.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.placeholder.withOpacity(.2), width: .5),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read().add(const GetAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAddUserButton(),
          BlocBuilder(
            builder: (context, state) {
              if (state is UsersLoaded) {
                employeeDataSource = EmployeeDataSource(employees: state.users);
              }
              return Skeletonizer(
                enabled: employeeDataSource == null,
                child: SfDataGridTheme(
                  data: const SfDataGridThemeData(gridLineColor: Colors.transparent),
                  child: SfDataGrid(
                    source: employeeDataSource ?? EmployeeDataSource(employees: []),
                    rowHeight: 70.h,
                    selectionMode: SelectionMode.multiple,
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    defaultColumnWidth: 120.w,
                    allowPullToRefresh: true,
                    columns: _buildColumns(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddUserButton() {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      onPressed: () => showAddUserDialog(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add),
          SizedBox(width: 8.w),
          Text('Add User'),
        ],
      ),
    );
  }

  List<GridColumn> _buildColumns() {
    return [
      GridColumn(
        columnName: 'Num',
        columnWidthMode: ColumnWidthMode.fitByCellValue,
        minimumWidth: 75.w,
        label: _buildHeader('#', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'Name',
        width: 200.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: _buildHeader('Name', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'Roles',
        label: _buildHeader('Roles', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'State',
        width: 90.w,
        label: _buildHeader('State', Alignment.center),
      ),
      GridColumn(
        columnName: 'Gender',
        width: 100.w,
        label: _buildHeader('Gender', Alignment.center),
      ),
      GridColumn(
        columnName: 'Phone',
        width: 200.w,
        label: _buildHeader('Phone', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'Email',
        width: 200.w,
        label: _buildHeader('Email', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'Info',
        width: 200.w,
        label: _buildHeader('Info', Alignment.centerLeft),
      ),
      GridColumn(
        columnName: 'Birth_Date',
        width: 120.w,
        label: _buildHeader('Birth Date', Alignment.center),
      ),
      GridColumn(
        columnName: 'Action',
        columnWidthMode: ColumnWidthMode.fill,
        label: _buildHeader('Details', Alignment.center),
      ),
    ];
  }

  Container _buildHeader(String text, Alignment alignment) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.only(
          topLeft: alignment == Alignment.centerLeft ? Radius.circular(12) : Radius.zero,
          bottomLeft: alignment == Alignment.centerLeft ? Radius.circular(12) : Radius.zero,
          topRight: alignment == Alignment.center ? Radius.circular(12) : Radius.zero,
          bottomRight: alignment == Alignment.center ? Radius.circular(12) : Radius.zero,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      alignment: alignment,
      child: Text(text),
    );
  }

  void showAddUserDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final nationalIdController = TextEditingController();
    final birthDateController = TextEditingController();

    String gender = 'male';
    String state = 'active';
    String role = 'student';


    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColor.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SizedBox(
          width: 600.w,
          height: 450.h,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(firstNameController, 'First Name', inputDecoration),
                _buildTextField(lastNameController, 'Last Name', inputDecoration),
                _buildTextField(emailController, 'Email', inputDecoration),
                _buildTextField(phoneController, 'Phone', inputDecoration),
                _buildTextField(addressController, 'Address', inputDecoration),
                _buildTextField(nationalIdController, 'National ID', inputDecoration),
                _buildDatePicker(birthDateController),
                _buildDropdowns(gender, state, role),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            minWidth: 200.w,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read().add(
                  AddUser(
                    UserModel(
                      firstName: firstNameController.text,
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
                context.read().add(const GetAllUsers());
              }
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, InputDecoration Function({String? labelText}) inputDecoration) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: controller,
        decoration: inputDecoration(labelText: labelText),
        validator: (value) => value?.isEmpty == true ? 'Please enter $labelText' : null,
      ),
    );
  }

  Widget _buildDatePicker(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: inputDecoration(labelText: 'Birth Date'),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
      validator: (value) => value?.isEmpty == true ? 'Please enter birth date' : null,
    );
  }

  Widget _buildDropdowns(String gender, String state, String role) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(child: _buildDropdown('Role', ['student', 'teacher', 'admin', 'parent', 'employee'], role, (value) => role = value!)),
          const SizedBox(width: 8),
          Expanded(child: _buildDropdown('Gender', ['male', 'female'], gender, (value) => gender = value!)),
          const SizedBox(width: 8),
          Expanded(child: _buildDropdown('State', ['active', 'inactive'], state, (value) => state = value!)),
        ],
      ),
    );
  }

  Widget _buildDropdown(String labelText, List<String> items, String value, Function(String?) onChanged) {
    return DropdownButtonFormField(
      value: value,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      decoration: inputDecoration(labelText: labelText),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<UserModel> employees}) {
    _data = employees.map((e) => DataGridRow(cells: [
      DataGridCell(columnName: 'Num', value: employees.indexOf(e) + 1),
      DataGridCell(columnName: 'Name', value: '${e.avatar}-${e.firstName} ${e.lastName}'),
      DataGridCell(columnName: 'Roles', value: e.roles),
      DataGridCell(columnName: 'State', value: e.state),
      DataGridCell(columnName: 'Gender', value: e.gender),
      DataGridCell(columnName: 'Phone', value: e.phone),
      DataGridCell(columnName: 'Email', value: e.email),
      DataGridCell(columnName: 'Info', value: e.address),
      DataGridCell(columnName: 'Birth_Date', value: DateFormat('yyyy-MM-dd').format(DateTime.parse(e.birthDate!))),
      DataGridCell(columnName: 'Action', value: e),
    ])).toList();
  }

  late final List<DataGridRow> _data;

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == 'Name') {
          return _buildNameCell(cell.value.toString());
        } else if (cell.columnName == 'State') {
          return _buildStateCell(cell.value.toString());
        } else if (cell.columnName == 'Action') {
          return _buildActionCell(cell.value as UserModel);
        } else {
          return Center(child: Text(cell.value.toString()));
        }
      }).toList(),
    );
  }

  Widget _buildNameCell(String value) {
    final parts = value.split('-');
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(parts[0]),
          radius: 25.sp,
        ),
        const SizedBox(width: 8),
        Flexible(child: Text(parts[1], overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  Widget _buildStateCell(String value) {
    final isActive = value == 'active';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.withOpacity(.07) : Colors.red.withOpacity(.07),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 12.sp, color: isActive ? const Color(0xff40997E) : const Color(0xffF93333)),
      ),
    );
  }

  Widget _buildActionCell(UserModel user) {
    return InkWell(
      // onTap: () => THelperFunctions.navigateToScreen(context: Get.context, widget: ProfileScreen(userDetails: user)),
      onTap: () =>
      AppRouter.navigateToProfileScreen(userDetails: user),

          THelperFunctions.navigateToScreen(context: Get.context, widget: ProfileScreen(userDetails: user)),
      child: Icon(Iconsax.eye, size: 25.sp, color: AppColor.primary),
    );
  }
}