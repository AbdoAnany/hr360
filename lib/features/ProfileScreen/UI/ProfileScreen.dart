




import 'package:flutter/material.dart';
import 'package:hr360/features/ProfileScreen/UI/widget/PieChartSample2.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

// class  HeaderProfilePage  extends StatelessWidget {
//   const HeaderProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//     //  mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(height: 20,),
//         SizedBox(height: 93,width: 950,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               Image.asset("assets/image-2.png",width: 75,height: 75,),
//               SizedBox(width: 8,),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: [
//                   SizedBox(height: 12,),
//                   Text('Vishaka Shekhawat', textAlign: TextAlign.left, style: TextStyle(
//                       color: Color.fromRGBO(0, 0, 0, 1),
//                       fontFamily: 'Inter',
//                       fontSize: 18,
//                       letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                       fontWeight: FontWeight.normal,
//                       height: 1
//                   ),),
//
//
//                   // Figma Flutter Generator ContentcuratorWidget - TEXT
//                   SizedBox(height: 4,),
//                   // Figma Flutter Generator Rectangle120Widget - RECTANGLE
//                 Row(
//                   children: [
//                     Text('Content Curator', textAlign: TextAlign.left, style: TextStyle(
//                         color: Color.fromRGBO(138, 138, 138, 1),
//                         fontFamily: 'Inter',
//                         fontSize: 14,
//                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                         fontWeight: FontWeight.normal,
//                         height: 1
//                     ),),  SizedBox(width: 8,),
//                     Container(
//                       width: 74,
//                       height: 22,
//                       decoration: BoxDecoration(
//                         borderRadius : BorderRadius.only(
//                           topLeft: Radius.circular(5),
//                           topRight: Radius.circular(5),
//                           bottomLeft: Radius.circular(5),
//                           bottomRight: Radius.circular(5),
//                         ),
//                         color : Color.fromRGBO(226, 255, 242, 1),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Figma Flutter Generator Ellipse14Widget - ELLIPSE
//                           Container(
//                               width: 10,
//                               height: 10,
//                               decoration: BoxDecoration(
//                                 color : Color.fromRGBO(46, 135, 96, 1),
//                                 borderRadius : BorderRadius.all(Radius.elliptical(10, 10)),
//                               )
//                           ),      // Figma Flutter Generator OnlineWidget - TEXT
//                           Text('Online', textAlign: TextAlign.left, style: TextStyle(
//                               color: Color.fromRGBO(46, 135, 96, 1),
//                               fontFamily: 'Inter',
//                               fontSize: 12,
//                               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                               fontWeight: FontWeight.normal,
//                               height: 1
//                           ),),
//
//                         ],),
//
//                     ),
//
//
//                   ],
//                 ),
//                   // Figma Flutter Generator Loggedinsince83023sep2022Widget - TEXT
//                   SizedBox(height: 8,),
//                   Text('Logged in Since 8:30 | 23 Sep 2022', textAlign: TextAlign.left, style: TextStyle(
//                       color: Color.fromRGBO(46, 135, 96, 1),
//                       fontFamily: 'Inter',
//                       fontSize: 12,
//                       letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                       fontWeight: FontWeight.normal,
//                       height: 1
//                   ),),
//
//                   // Figma Flutter Generator MdiclocktimefouroutlineWidget - FRAME
//
//
//                  // Center(child: Text("Profile Screen"),),
//                 ],
//               ),
//               Spacer(),
//
//               Column(
//                 children: [
//                   // Figma Flutter Generator Assigned966Widget - TEXT
//                   Text('Assigned 966', textAlign: TextAlign.left, style: TextStyle(
//                       color: Colors.red,
//                       fontFamily: 'Inter',
//                       fontSize: 16,
//                       letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                       fontWeight: FontWeight.normal,
//                       height: 1
//                   ),),
//                   Row(
//                     children: [
//                       Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             color : Color.fromRGBO(255, 255, 255, 1),
//                           ),
//                           child: Icon(Iconsax.clock)
//                       ), SizedBox(width: 8,),Text('Joined 23-09-2022', textAlign: TextAlign.left, style: TextStyle(
//                           color: Color.fromRGBO(138, 138, 138, 1),
//                           fontFamily: 'Inter',
//                           fontSize: 14,
//                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                           fontWeight: FontWeight.normal,
//                           height: 1
//                       ),)
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmployeeHeader(),
            SizedBox(height: 16.0),
        Container(
          height: 50.0,width: 450,
          child: TabBar(
            controller: _tabController,indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
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

              EmployeeProfilePage(),
              AttendanceReportPage(),

            ],
          ),)
          ],
        ),
      ),
    );
  }
}

class EmployeeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/image-2.png"),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vishaka Shekhawat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Content Curator', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(138, 138, 138, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),  SizedBox(width: 8,),
                Container(
                  width: 74,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color : Color.fromRGBO(226, 255, 242, 1),
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
                            color : Color.fromRGBO(46, 135, 96, 1),
                            borderRadius : BorderRadius.all(Radius.elliptical(10, 10)),
                          )
                      ),      // Figma Flutter Generator OnlineWidget - TEXT
                      Text('Online', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(46, 135, 96, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),

                    ],),

                ),


              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 4.0),
                Text('Logged in Since 8:30 | 23 Sep 2022', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(46, 135, 96, 1),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),

              ],
            ),

          ],
        ),
        Spacer(),    Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color : Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Icon(Iconsax.clock)
                ), SizedBox(width: 8,),Text('Joined 23-09-2022', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(138, 138, 138, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
              ],
            ),
SizedBox(height: 8,),
            Row(children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xffFFF1F1),
                child: Icon(Icons.checklist_rounded,color:  Color(0xffCC1313),size: 16,),),SizedBox(width: 4,),
              Text('Assigned', textAlign: TextAlign.left, style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: 4,),
              Text('966', textAlign: TextAlign.left, style: TextStyle(
                  color:  Color(0xffCC1313),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: 20,),
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xffF1FFF1),
                child: Icon(Icons.checklist_rounded,color:  Color(0xff2E8760),size: 16,),),SizedBox(width: 4,),
              Text('Completed', textAlign: TextAlign.left, style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: 4,),
              Text('852', textAlign: TextAlign.left, style: TextStyle(
                  color:  Color(0xff2E8760),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
            ],)
          ],
        ),  Spacer(),
        Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Remove'),
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('+Assign Task'),
            // ),
            SizedBox(height: 16.0),
            Container(height: 147,width: 270,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:  Color.fromRGBO(242, 237, 253, 1),
                border: Border.all(color:  Color.fromRGBO(242, 237, 253, 1),),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Efficiency Score',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff3C3C3C)),),
               //   SizedBox(height: 4,),
                  Text(
                    '85%',style: TextStyle(fontSize: 48,color: AppColor.primary),),
                  Align(alignment:Alignment.centerRight,child: Text('85/100',style: TextStyle(fontSize: 20,color: AppColor.black),)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EmployeeStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:

      [
        StatCard(state: AttendanceState( status: 'Total Tasks',
          value: tasks.length.toString(),
          color: Colors.grey,),

        ),

        StatCard(
        state:  AttendanceState(      status: 'Not Started',
            value: tasks.where((ee)=>ee.status=='Not Started').length.toString(),
            color: Colors.orange,),
          // title: 'Not Started',
          // value: tasks.where((ee)=>ee.status=='Not Started').length.toString(),
          // color: Colors.orange,
        ),
        StatCard(

          state:  AttendanceState(      status: 'Ongoing',
            value: tasks.where((ee)=>ee.status=='Ongoing').length.toString(),
            color: Colors.blue,),
        ),   StatCard(

          state:  AttendanceState(      status: 'Ongoing',
            value: tasks.where((ee)=>ee.status=='Ongoing').length.toString(),
            color: Colors.blue,),
        ),
        StatCard(

          state:  AttendanceState(      status: 'Completed',
            value: tasks.where((ee)=>ee.status=='Completed').length.toString(),
            color: Colors.green,),
        ),
        StatCard(

          state:  AttendanceState(      status: 'Overdue',
            value: tasks.where((ee)=>ee.status=='Overdue').length.toString(),
            color: Colors.red,),
        ),

      ],
    );
  }
}

class StatCard extends StatelessWidget {
  // final String title;
  // final String value;
  // final Color color;
 final AttendanceState state;
  StatCard({required this.state,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
      decoration: BoxDecoration(
        color: state.color.withOpacity(.1),
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Row(
        children: [
          Text("${state.status} : ${state.value}",style: TextStyle(
      fontSize: 16,
        fontWeight: FontWeight.w600,
        color: state.color,
      ),),

        ],
      ),
    );
  }
}
class Task {
  final String title;
  final String dateRange;
  final String assignedTo;
  final String status; // Add a status field to indicate task status

  Task({
    required this.title,
    required this.dateRange,
    required this.assignedTo,
    required this.status,
  });
}
class AttendanceState {


  final String status; 
   String? value;
  final Color color;
  AttendanceState({



    required this.status,
     this.value,
    required this.color,
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
    assignedTo: 'John Doe', status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe', status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe', status: 'Completed',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe', status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe', status: 'Ongoing',
  ),
  Task(
    title: 'Prepare slides for meeting',
    dateRange: '10 Dec 2023 - 15 Dec 2023',
    assignedTo: 'John Doe', status: 'Overdue',
  ),
  // Add more tasks as needed
];
final List<AttendanceState> states = [
  // State(
  //   title: 'Add a Quiz for Students of 3CO - JYV on the...',
  //   dateRange: '06 Dec 2023 - 12 Dec 2023',
  //   assignedTo: 'Devesh Gupta', status: 'Not Started',
  //
  // ),
  // State(
  //   title: 'Prepare slides for meeting',
  //   dateRange: '10 Dec 2023 - 15 Dec 2023',
  //   assignedTo: 'John Doe', status: 'Ongoing',
  // ),   State(
  //   title: 'Prepare slides for meeting',
  //   dateRange: '10 Dec 2023 - 15 Dec 2023',
  //   assignedTo: 'John Doe', status: 'Ongoing',
  // ),   State(
  //   title: 'Prepare slides for meeting',
  //   dateRange: '10 Dec 2023 - 15 Dec 2023',
  //   assignedTo: 'John Doe', status: 'Completed',
  // ),   State(
  //   title: 'Prepare slides for meeting',
  //   dateRange: '10 Dec 2023 - 15 Dec 2023',
  //   assignedTo: 'John Doe', status: 'Ongoing',
  // ),
  // State(
  //
  // title: 'Ongoing', status: '', value: '', color: null,
  // ),
  AttendanceState(
      status:  'Total Tasks',  color: Colors.grey,value: "0"),
  AttendanceState(
      status: 'Not Started',  color: Colors.orange,value: "0"),
  AttendanceState(
      status: 'Ongoing',  color: Colors.blue,value: "0")
  ,  AttendanceState(
      status: 'Completed',  color: Colors.green,value: "0"),
  AttendanceState(
      status: 'Overdue',  color: Colors.red,value: "0"),
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
  final Task tasks;

  TaskCard({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return


      Card(
      child: ListTile(
        leading:  Icon(
          Icons.assignment,
          color:states.firstWhere((e)=>e.status==tasks.status).color ,
        ),
        title: Text(tasks.title),
        subtitle: Text(tasks.dateRange),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            Text(tasks.assignedTo),
          ],
        ),
      ),
    );
  }
}


class EmployeeProfilePage extends StatelessWidget {
  final Employee employee = Employee(
    name: 'Vishaka Shekhawat',
    dateOfJoining: '20 Apr 2023',
    dateOfBirth: '30 Oct 2002',
    contactNumber: '+91 99999 99999',
    emergencyContactNumber: '+91 98765 98765',
    email: 'vishakha345@gmail.com',
    highestQualification: 'BBA',
    institutionName: 'NarsejimoHanrao Phule University, Pune',
    yearOfQualification: '2017',
    fatherDetails: FamilyDetails(
      name: 'Manohar Lal Shekhawat',
      profession: 'Businessmen',
      organizationName: 'Swami Traders Private Limited',
      contactNumber: '+91 99999 99999',
      whatsappNumber: '+91 99999 99999',
      email: 'swamitraders1@gmail.com',
      dateOfBirth: '30 Apr 1975',
    ),
    motherDetails: FamilyDetails(
      name: 'Shakti Devi Shekhawat',
      profession: 'Housewife',
      organizationName: '',
      contactNumber: '',
      whatsappNumber: '',
      email: '',
      dateOfBirth: '',
    ),
  );

  EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SectionTitle(title: 'Personal Details'),
          DetailItem(label: 'Name', value: employee.name),
          DetailItem(label: 'Date of Joining', value: employee.dateOfJoining),
          DetailItem(label: 'Date of Birth', value: employee.dateOfBirth),
          DetailItem(label: 'Contact Number', value: employee.contactNumber),
          DetailItem(label: 'Emergency Contact Number', value: employee.emergencyContactNumber),
          DetailItem(label: 'Email Address', value: employee.email),
          Divider(),
          SectionTitle(title: 'Educational Details'),
          DetailItem(label: 'Highest Qualification', value: employee.highestQualification),
          DetailItem(label: 'Name of Institution', value: employee.institutionName),
          DetailItem(label: 'Year of Qualification', value: employee.yearOfQualification),
          Divider(),
          SectionTitle(title: 'Family Details'),
          FamilySection(title: "Father's Name", details: employee.fatherDetails),
          FamilySection(title: "Mother's Name", details: employee.motherDetails),
        ],
      ),
    );
  }
}



class AttendanceReportPage extends StatelessWidget {
  final AttendanceSummary summary = AttendanceSummary(
    presentPercentage: 30,
    halfDayPercentage: 10,
    leavesPercentage: 60,
  );

  final List<AttendanceRecord> attendanceRecords = [
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Present'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Half Day'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Leave'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Leave'),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: 'Leave'),


  ];

  AttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attendance Report',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PieChartSample2(),
                ),
                Expanded(
                  child: Column(children: [
                    SizedBox(height: 16.0),
                    Text(
                      'Attendance Logs',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: attendanceRecords.length,
                        itemBuilder: (context, index) {
                          return AttendanceLogItem(record: attendanceRecords[index]);
                        },
                      ),
                    ),
                  ],),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}

class AttendanceLogItem extends StatelessWidget {
  final AttendanceRecord record;

  AttendanceLogItem({required this.record});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/weman.png'), // Replace with actual image asset
            radius: 20,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),SizedBox(width: 100,),

                Icon(
                  record.status == 'Present' ? Iconsax.login : Iconsax.logout,
                  color: record.status == 'Present' ? Colors.green : Colors.red,
                ),SizedBox(width: 8,),
                Text(record.time),
              ],
            ),
          ),
          Text(record.date),
          SizedBox(width: 16.0),
          Icon(
            record.status == 'Present' ? Icons.check_circle : Icons.cancel,
            color: record.status == 'Present' ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem({required this.label, required this.value});

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
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class FamilySection extends StatelessWidget {
  final String title;
  final FamilyDetails details;

  FamilySection({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DetailItem(label: 'Profession', value: details.profession),
        if (details.organizationName.isNotEmpty) DetailItem(label: 'Name of Organization', value: details.organizationName),
        DetailItem(label: 'Contact Number', value: details.contactNumber),
        if (details.whatsappNumber.isNotEmpty) DetailItem(label: 'Whatsapp Number', value: details.whatsappNumber),
        if (details.email.isNotEmpty) DetailItem(label: 'Email Address', value: details.email),
        if (details.dateOfBirth.isNotEmpty) DetailItem(label: 'Date of Birth', value: details.dateOfBirth),
      ],
    );
  }
}

class Employee {
  final String name;
  final String dateOfJoining;
  final String dateOfBirth;
  final String contactNumber;
  final String emergencyContactNumber;
  final String email;
  final String highestQualification;
  final String institutionName;
  final String yearOfQualification;
  final FamilyDetails fatherDetails;
  final FamilyDetails motherDetails;

  Employee({
    required this.name,
    required this.dateOfJoining,
    required this.dateOfBirth,
    required this.contactNumber,
    required this.emergencyContactNumber,
    required this.email,
    required this.highestQualification,
    required this.institutionName,
    required this.yearOfQualification,
    required this.fatherDetails,
    required this.motherDetails,
  });
}

class FamilyDetails {
  final String name;
  final String profession;
  final String organizationName;
  final String contactNumber;
  final String whatsappNumber;
  final String email;
  final String dateOfBirth;

  FamilyDetails({
    required this.name,
    required this.profession,
    required this.organizationName,
    required this.contactNumber,
    required this.whatsappNumber,
    required this.email,
    required this.dateOfBirth,
  });
}

class AttendanceRecord {
  final String name;
  final String time;
  final String date;
  final String status;

  AttendanceRecord({
    required this.name,
    required this.time,
    required this.date,
    required this.status,
  });
}

class AttendanceSummary {
  final double presentPercentage;
  final double halfDayPercentage;
  final double leavesPercentage;

  AttendanceSummary({
    required this.presentPercentage,
    required this.halfDayPercentage,
    required this.leavesPercentage,
  });
}
