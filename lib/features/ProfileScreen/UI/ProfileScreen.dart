import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/di.dart';
import 'package:hr360/features/ProfileScreen/UI/page/profile/EmployeeProfile.dart';
import 'package:hr360/features/6_task/presentation/manager/task_cubit.dart';
import 'package:hr360/features/6_task/domain/entities/TaskModel.dart';
import 'package:hr360/features/6_task/presentation/pages/taskTab.dart';
import 'package:hr360/features/ProfileScreen/UI/widget/PieChartSample2.dart';
import 'package:iconsax/iconsax.dart';

import '../../1_login/data/user_model.dart';
import '../../6_task/data/repositories/FirebaseTaskRepository.dart';

class ProfileScreen extends StatefulWidget {
  UserModel? userDetails;
  ProfileScreen({super.key, this.userDetails});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmployeeHeader(userDetails: widget.userDetails),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 50.0,
            width: 450,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'Tasks'),
                Tab(text: 'Profile'),
                Tab(text: 'Attendance'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TabBarView(
                controller: _tabController,
                children: [
                  TaskTab(
                    userDetails: widget.userDetails,
                  ),
                  EmployeeProfilePage(
                    userDetails: widget.userDetails,
                  ),
                  AttendanceReportPage(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmployeeHeader extends StatelessWidget {
  EmployeeHeader({super.key, this.userDetails});
  UserModel? userDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColor.lightBackground),
              ),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Iconsax.arrow_left_2))),
          const SizedBox(
            width: 8,
          ),
          const CircleAvatar(
              radius: 30, backgroundImage: AssetImage("assets/image-2.png")),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${userDetails?.firsName} ${userDetails?.lastName}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    userDetails?.roles ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 74,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: (userDetails?.state?.toLowerCase() == "active"
                              ? AppColor.success
                              : AppColor.error)
                          .withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Figma Flutter Generator Ellipse14Widget - ELLIPSE
                        Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color:
                                  userDetails?.state?.toLowerCase() == "active"
                                      ? AppColor.success
                                      : AppColor.error,
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(10, 10)),
                            )), // Figma Flutter Generator OnlineWidget - TEXT
                        Text(
                          '${userDetails?.state}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  userDetails?.state?.toLowerCase() == "active"
                                      ? AppColor.success
                                      : AppColor.error,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.0),
                  Text(
                    'Logged in Since 8:30 | 23 Sep 2022',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(46, 135, 96, 1),
                        fontFamily: 'Inter',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: const Icon(Iconsax.clock)),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Joined 23-09-2022',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xffFFF1F1),
                    child: Icon(
                      Iconsax.task,
                      color: Color(0xffCC1313),
                      size: 12,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Assigned',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '966',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xffCC1313),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xffF1FFF1),
                    child: Icon(
                      Iconsax.task,
                      color: Color(0xff2E8760),
                      size: 12,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Completed',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '852',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff2E8760),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}




class AttendanceState {
  final String? status;
  String? value;
  final Color? color;

  AttendanceState({
    this.status,
    this.value,
    this.color,
  });

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AttendanceState &&
        other.status == status &&
        other.value == value &&
        other.color == color;
  }

  @override
  int get hashCode => status.hashCode ^ value.hashCode ^ color.hashCode;

  // copyWith method
  AttendanceState copyWith({
    String? status,
    String? value,
    Color? color,
  }) {
    return AttendanceState(
      status: status ?? this.status,
      value: value ?? this.value,
      color: color ?? this.color,
    );
  }
}


enum DayState { present, halfDay, absent }

final List<AttendanceRecord> attendanceRecords = [
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.present),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.halfDay),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.absent),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.absent),
  AttendanceRecord(
      name: 'Vishaka Shekhawat',
      time: '12:30',
      date: '12 May 2023',
      status: DayState.absent),
];

class AttendanceReportPage extends StatelessWidget {
  // final AttendanceSummary summary = AttendanceSummary(
  //   presentPercentage: 30,
  //   halfDayPercentage: 10,
  //   leavesPercentage: 60,
  // );

  AttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: 1.sw < 1000
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: widgetList)
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: widgetList));
  }

  List<Widget> widgetList = [
    const Expanded(
      flex: 2,
      child: Column(
        children: [
          Text(
            'Attendance Report',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(child: PieChartSample2()),
        ],
      ),
    ),
    const SizedBox(
      width: 80,
    ),
    Expanded(
      flex: 3,
      child: Column(
        children: [
          const Text(
            'Attendance Logs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: attendanceRecords.length,
              itemBuilder: (context, index) {
                return AttendanceLogItem(record: attendanceRecords[index]);
              },
            ),
          ),
        ],
      ),
    )
  ];
}

class AttendanceLogItem extends StatelessWidget {
  final AttendanceRecord? record;

  const AttendanceLogItem({super.key, this.record});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
                'assets/weman.png'), // Replace with actual image asset
            radius: 20,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record?.name ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 100,
                ),
                Icon(
                  record?.status == DayState.present
                      ? Iconsax.login
                      : Iconsax.logout,
                  color: record?.status == DayState.present
                      ? Colors.green
                      : Colors.red,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(record?.time ?? ""),
              ],
            ),
          ),
          Text(record!.date ?? ""),
          const SizedBox(width: 16.0),
          Icon(
            record!.status! == DayState.present
                ? Icons.check_circle
                : Icons.cancel,
            color:
                record!.status == DayState.present ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String? title;

  SectionTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String? label;
  final String? value;

  DetailItem({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? ""),
          ),
        ],
      ),
    );
  }
}

class FamilySection extends StatelessWidget {
  final String? title;
  final FamilyDetails? details;

  const FamilySection({super.key, this.title, this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Text(
          title ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        DetailItem(label: 'Profession', value: details!.profession),
        if (details!.organizationName!.isNotEmpty)
          DetailItem(
              label: 'Name of Organization', value: details!.organizationName),
        DetailItem(label: 'Contact Number', value: details!.contactNumber),
        if (details!.whatsappNumber!.isNotEmpty)
          DetailItem(label: 'Whatsapp Number', value: details!.whatsappNumber),
        if (details!.email!.isNotEmpty)
          DetailItem(label: 'Email Address', value: details!.email),
        if (details!.dateOfBirth!.isNotEmpty)
          DetailItem(label: 'Date of Birth', value: details!.dateOfBirth),
      ],
    );
  }
}

class Employee {
  final String? name;
  final String? dateOfJoining;
  final String? dateOfBirth;
  final String? contactNumber;
  final String? emergencyContactNumber;
  final String? email;
  // final String? highestQualification;
  // final String? institutionName;
  // final String? yearOfQualification;
  final FamilyDetails? fatherDetails;
  final FamilyDetails? motherDetails;

  Employee({
    this.name,
    this.dateOfJoining,
    this.dateOfBirth,
    this.contactNumber,
    this.emergencyContactNumber,
    this.email,
    //  this.highestQualification,
    //  this.institutionName,
    //  this.yearOfQualification,
    this.fatherDetails,
    this.motherDetails,
  });
}

class FamilyDetails {
  final String? name;
  final String? profession;
  final String? organizationName;
  final String? contactNumber;
  final String? whatsappNumber;
  final String? email;
  final String? dateOfBirth;

  FamilyDetails({
    this.name,
    this.profession,
    this.organizationName,
    this.contactNumber,
    this.whatsappNumber,
    this.email,
    this.dateOfBirth,
  });
}

class AttendanceRecord {
  final String? name;
  final String? time;
  final String? date;
  final DayState? status;

  AttendanceRecord({
    this.name,
    this.time,
    this.date,
    this.status,
  });
}
