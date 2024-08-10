import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:hr360/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../app.dart';
import '../../../../../../core/utils/formatters/formatter.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

import '../../../../../ProfileScreen/UI/ProfileScreen.dart';
import '../../../widgets/Mainbar.dart';
import '../../Home.dart';

class AttendanceGridView extends StatefulWidget {
  const AttendanceGridView({Key? key}) : super(key: key);

  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> {
  EmployeeDataSource? employeeDataSource;
  List<UserDetails> userDetailsList = [];
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getDataFromServer().then((data) {
      userDetailsList = (data as List)
          .map<UserDetails>((e) => UserDetails.fromJson(e))
          .toList();
      employeeDataSource = EmployeeDataSource(employees: userDetailsList);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, s) {
        return Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 12.w,
          // ),
          child: employeeDataSource == null
              ? Center(child: const CircularProgressIndicator())
              : SfDataGridTheme(
                  data: const SfDataGridThemeData(
                    //  headerColor: Color(0xffF5F5F5),
                    gridLineColor: Colors.transparent,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: SfDataGrid(
                      source: employeeDataSource!,
                      checkboxColumnSettings: DataGridCheckboxColumnSettings(),
                      rowHeight: 70, selectionMode: SelectionMode.multiple,
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      //showHorizontalScrollbar: true,
                      defaultColumnWidth: 120,

                      allowPullToRefresh: true,
                      // allowFiltering: true,
                      // allowSorting: true,
                      // showCheckboxColumn: true,

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
                                child: const Text(
                                  '#',
                                ))),
                        GridColumn(
                            columnName: 'ID',
                            columnWidthMode: ColumnWidthMode.fitByCellValue,
                            label: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                ),
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'ID',
                                ))),
                        GridColumn(
                            columnName: 'Name',
                            width: 200,
                            columnWidthMode: ColumnWidthMode.fill,
                            label: Container(
                                color: Color(0xffF5F5F5),
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text('Name'))),
                        // GridColumn(
                        //     columnName: 'Address',
                        //     //     width: 200,
                        //     columnWidthMode: ColumnWidthMode.fill,
                        //     label: Container(
                        //         color: Color(0xffF5F5F5),
                        //         padding: EdgeInsets.all(16.0),
                        //         alignment: Alignment.center,
                        //         child: Text('Address'))),
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
                        // GridColumn(
                        //     columnName: 'Email',
                        //     columnWidthMode: ColumnWidthMode.fitByCellValue,
                        //     label: Container(
                        //         color: Color(0xffF5F5F5),
                        //         padding: EdgeInsets.all(16.0),
                        //         alignment: Alignment.center,
                        //         child: Text('Email'))),
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
                           // width: 120,
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
                ),
        );
      }),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({List<UserDetails>? employees}) {
    _employees = List.generate(employees!.length, (i) {
      UserDetails e = employees[i];
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'Num', value: i + 1),
        DataGridCell<int>(columnName: 'ID', value: e.userId),
        DataGridCell<String>(
          columnName: 'Name',
          value: "${e.firsName} ${e.lastName}",
        ),
        // DataGridCell<String>(columnName: 'Address', value: e.address),
        DataGridCell<String>(columnName: 'Roles', value: e.roles),
        DataGridCell<String>(columnName: 'State', value: e.state),
        DataGridCell<String>(columnName: 'Gender', value: e.gender),
        // DataGridCell<String>(columnName: 'Email', value: e.email),
        DataGridCell<String>(columnName: 'Phone', value: e.phone),
        DataGridCell<String>(
          columnName: 'Birth_Date',
          value: TFormatter.formatDate(
              DateTime.parse(e.birthDate ?? '2010-07-19')),
        ),
        DataGridCell<UserDetails>(columnName: 'Action', value: e),
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
                            // border: Border.all( color:  dataGridCell.value=="active"?Color(0xff40997E):Color(0xffF93333),width: .5),
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
                              // HomeControl.pageUi(PageType.custom,custom: ProfileScreen(userDetails:dataGridCell.value ));
                              // HomeCubit.get(Get.context).update();
                              // HomeCubit.get(Get.context).changePage(PageType.profile, arguments: dataGridCell.value);
                              // open Drawer

                              Navigator.push(
                                  Get.context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen(
                                            userDetails: dataGridCell.value,
                                          )));
                               ;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColor.borderPrimary,
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
