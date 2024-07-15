




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class  EmployeeProfilePage  extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        SizedBox(height: 93,width: 950,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/image-2.png",width: 75,height: 75,),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 12,),
                  Text('Vishaka Shekhawat', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 18,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),


                  // Figma Flutter Generator ContentcuratorWidget - TEXT
                  SizedBox(height: 4,),
                  // Figma Flutter Generator Rectangle120Widget - RECTANGLE
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
                  // Figma Flutter Generator Loggedinsince83023sep2022Widget - TEXT
                  SizedBox(height: 8,),
                  Text('Logged in Since 8:30 | 23 Sep 2022', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(46, 135, 96, 1),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),

                  // Figma Flutter Generator MdiclocktimefouroutlineWidget - FRAME


                 // Center(child: Text("Profile Screen"),),
                ],
              ),
              Spacer(),

              Column(
                children: [
                  // Figma Flutter Generator Assigned966Widget - TEXT
                  Text('Assigned 966', textAlign: TextAlign.left, style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
              Tab(text: 'Salary'),
              Tab(text: 'Attendance'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              TaskList(),

              Center(child: Text('Prfile')),
              Center(child: Text('Salary')),
              Center(child: Text('Attendance')),
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
      children: [
        StatCard(
          title: 'Total Tasks',
          value: '245',
          color: Colors.grey,
        ),
        StatCard(
          title: 'Not Started',
          value: '120',
          color: Colors.orange,
        ),
        StatCard(
          title: 'Ongoing',
          value: '125',
          color: Colors.blue,
        ),
        StatCard(
          title: 'Completed',
          value: '25',
          color: Colors.green,
        ),
        StatCard(
          title: 'Overdue',
          value: '25',
          color: Colors.red,
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  StatCard({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Row(
        children: [
          Text(title+" : "+ value,style: TextStyle(
      fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),),

        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmployeeStats(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return TaskCard();
            },
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.assignment,
          color: Colors.blue,
        ),
        title: Text('Add a Quiz for Students of 3CO - JYV on the...'),
        subtitle: Text('06 Dec 2023 - 12 Dec 2023'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            Text('Devesh Gupta'),
          ],
        ),
      ),
    );
  }
}
