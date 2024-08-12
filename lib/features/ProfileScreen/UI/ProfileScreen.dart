import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/ProfileScreen/UI/page/profile/EmployeeProfile.dart';
import 'package:hr360/features/ProfileScreen/UI/widget/PieChartSample2.dart';
import 'package:iconsax/iconsax.dart';

import '../../1_login/data/user_model.dart';

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
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmployeeHeader(),
        Container(
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
          child: TabBarView(
            controller: _tabController,
            children: [
              TaskList(),
              EmployeeProfilePage(userDetails:widget. userDetails,),
              const AttendanceReportPage(),
            ],
          ),
        )
      ],
    );
  }
}

class EmployeeHeader extends StatelessWidget {
  const EmployeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/image-2.png"),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vishaka Shekhawat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Content Curator',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
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
                      color: Color.fromRGBO(226, 255, 242, 1),
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
                              color: Color.fromRGBO(46, 135, 96, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 10)),
                            )), // Figma Flutter Generator OnlineWidget - TEXT
                        Text(
                          'Online',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(46, 135, 96, 1),
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
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Icon(Iconsax.clock)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
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
              Row(
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
          // Container(
          //   height: 147,
          //   width: 270,
          //   padding: EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     color: Color.fromRGBO(242, 237, 253, 1),
          //     border: Border.all(
          //       color: Color.fromRGBO(242, 237, 253, 1),
          //     ),
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         'Efficiency Score',
          //         style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: Color(0xff3C3C3C)),
          //       ),
          //       //   SizedBox(height: 4,),
          //       Text(
          //         '85%',
          //         style: TextStyle(fontSize: 48, color: AppColor.primary),
          //       ),
          //       Align(
          //           alignment: Alignment.centerRight,
          //           child: Text(
          //             '85/100',
          //             style: TextStyle(fontSize: 20, color: AppColor.black),
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class EmployeeStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatCard(
          state: AttendanceState(
            status: 'Total Tasks',
            value: tasks.length.toString(),
            color: Colors.grey,
          ),
        ),
        StatCard(
          state: AttendanceState(
            status: 'Not Started',
            value: tasks
                .where((ee) => ee.status == 'Not Started')
                .length
                .toString(),
            color: Colors.orange,
          ),
          // title: 'Not Started',
          // value: tasks.where((ee)=>ee.status=='Not Started').length.toString(),
          // color: Colors.orange,
        ),
        StatCard(
          state: AttendanceState(
            status: 'Ongoing',
            value:
                tasks.where((ee) => ee.status == 'Ongoing').length.toString(),
            color: Colors.blue,
          ),
        ),
        StatCard(
          state: AttendanceState(
            status: 'Completed',
            value:
                tasks.where((ee) => ee.status == 'Completed').length.toString(),
            color: Colors.green,
          ),
        ),
        StatCard(
          state: AttendanceState(
            status: 'Overdue',
            value:
                tasks.where((ee) => ee.status == 'Overdue').length.toString(),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  // final String? title;
  // final String? value;
  // final Color color;
  final AttendanceState? state;
  const StatCard({
    super.key,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8,bottom: 12, top: 12),
      decoration:
          //state?.status!="Total Tasks"?null:
          BoxDecoration(
              color: state?.color?.withOpacity(.07),
              borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Text(
            "${state?.status} : ${state?.value}",
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

class Task {
  final String? title;
  final String? dateRange;
  final String? assignedTo;
  final String? status; // Add a status field to indicate task status

  Task({
    this.title,
    this.dateRange,
    this.assignedTo,
    this.status,
  });
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
}

final List<Task> tasks = [
  Task(
    title: 'Add a Quiz for Students of 3CO - JYV on the...',
    dateRange: '06 Dec 2023 - 12 Dec 2023',
    assignedTo: 'Devesh Gupta',
    status: 'Not Started',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Completed',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe',
    status: 'Overdue',
  ),
  // Add more tasks as needed
];
final List<AttendanceState> states = [
  AttendanceState(status: 'Total Tasks', color: Colors.grey, value: "0"),
  AttendanceState(status: 'Not Started', color: Colors.orange, value: "0"),
  AttendanceState(status: 'Ongoing', color: Colors.blue, value: "0"),
  AttendanceState(status: 'Completed', color: Colors.green, value: "0"),
  AttendanceState(status: 'Overdue', color: Colors.red, value: "0"),
  // Add more tasks as needed
];

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmployeeStats(),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(tasks: tasks[index]);
            },
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task? tasks;

  const TaskCard({super.key, this.tasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: states
          .firstWhere((e) => e.status == tasks?.status)
          .color
          ?.withOpacity(.07),
      color: states
          .firstWhere((e) => e.status == tasks?.status)
          .color
          ?.withOpacity(.07),
      shadowColor: states
          .firstWhere((e) => e.status == tasks?.status)
          .color
          ?.withOpacity(.07),
      child: ListTile(
        leading: Icon(
          Iconsax.activity5,
          color: states.firstWhere((e) => e.status == tasks?.status).color,
        ),
        title: Text(tasks?.title ?? ""),
        subtitle: Text(tasks?.dateRange ?? ""),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            Text(tasks?.assignedTo ?? ""),
          ],
        ),
      ),
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

  const AttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                        return AttendanceLogItem(
                            record: attendanceRecords[index]);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
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
