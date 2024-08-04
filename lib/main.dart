import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../app.dart';
import 'core/utils/constants/colors.dart';
import 'di.dart';


//
Future<void> main() async {
 await initAppModule();
  runApp(const App());
}

// import 'package:flutter/material.dart';
// import 'package:hr360/core/utils/constants/colors.dart';
// import 'package:iconsax/iconsax.dart'; // Use iconsax for icons
//
// void main() {
//  runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//   return MaterialApp(
//    title: 'Dashboard UI',
//    debugShowCheckedModeBanner: false,
//    theme: ThemeData(
//     primarySwatch: Colors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: const TextTheme(
//      bodyLarge: TextStyle(color: Colors.black),
//      bodyMedium: TextStyle(color: Colors.black),
//     ),
//    ),
//    home: DashboardScreen(),
//   );
//  }
// }

class DashboardScreen extends StatefulWidget {
 @override
 _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 PageController _pageController = PageController();

 int _currentIndex = 0;

 void _onItemTapped(int index) {
  setState(() {
   _currentIndex = index;
  });
  _pageController.jumpToPage(index);
  // _pageController.animateToPage(
  //  index,
  //  duration: Duration(milliseconds: 300),
  //  curve: Curves.easeInOut,
  // );
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: Row(
    children: [
     Sidebar(
      onItemTapped: _onItemTapped,
      currentIndex: _currentIndex,
     ),
     Expanded(
      child: Column(
       children: [
        Header(),
        Expanded(
         child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Disable swipe navigation
          children: [
           DashboardPage(),
           AcademicsPage(),
           AccountsPage(),
           SupportPage(),
           StudentsPage(),
           AttendancePage(),
           AnalyticsPage(),
           TeamPage(),
           CalendarPage(),
           LeadsPage(),
           VisitorsPage(),
          ],
         ),
        ),
       ],
      ),
     ),
    ],
   ),
  );
 }
}

class Sidebar extends StatelessWidget {
 final Function(int) onItemTapped;
 final int currentIndex;

 Sidebar({required this.onItemTapped, required this.currentIndex});

 @override
 Widget build(BuildContext context) {
  return Container(
   width: 200,
   color: Color(0xFFEEF2F5),
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Column(
      children: [
       SizedBox(height: 20),
       ListTile(
        title: Text(
         'TIPS-G',
         style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
         ),
        ),
       ),
       _sidebarItem(Iconsax.category, 'Dashboard', 0),
       _sidebarItem(Iconsax.activity, 'Academics', 1),
       _sidebarItem(Iconsax.money, 'Accounts', 2),
       _sidebarItem(Iconsax.message, 'Support', 3),
       _sidebarItem(Iconsax.user, 'Students', 4),
       _sidebarItem(Iconsax.calendar, 'Attendance', 5),
       _sidebarItem(Iconsax.graph, 'Analytics', 6),
       _sidebarItem(Iconsax.people, 'Team', 7),
       _sidebarItem(Iconsax.calendar, 'Calendar', 8),
       _sidebarItem(Iconsax.link, 'Leads', 9),
       _sidebarItem(Iconsax.people, 'Visitors', 10),
      ],
     ),
    ],
   ),
  );
 }

 Widget _sidebarItem(IconData icon, String label, int index) {
  return ListTile(
   leading: Icon(
    icon,
    color: currentIndex == index ? Colors.blue : Colors.black,
   ),
   title: Text(
    label,
    style: TextStyle(
     color: currentIndex == index ? Colors.blue : Colors.black,
    ),
   ),
   onTap: () => onItemTapped(index),
  );
 }
}

class Header extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Container(
   padding: EdgeInsets.symmetric(horizontal: 20),
   color: Colors.white,
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(height: 20),
       Text(
        'Welcome Pooran',
        style: TextStyle(
         fontSize: 24,
         fontWeight: FontWeight.bold,
        ),
       ),
       Text(
        'Senior Admin - TIPSG Education Pvt. Ltd.',
        style: TextStyle(
         color: Colors.grey,
         fontSize: 14,
        ),
       ),
      ],
     ),
     Row(
      children: [
       Container(
        width: 200,
        child: TextField(
         decoration: InputDecoration(
          hintText: 'Search Dashboard',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8),
          ),
         ),
        ),
       ),
       SizedBox(width: 20),
       Icon(Icons.notifications, color: Colors.black),
       SizedBox(width: 20),
       Icon(Icons.chat, color: Colors.black),
       SizedBox(width: 20),
       CircleAvatar(
       radius: 20,
       ),
      ],
     ),
    ],
   ),
  );
 }
}

class DashboardPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Dashboard"));
 }
}

class AcademicsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Academics"));
 }
}

class AccountsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Accounts"));
 }
}

class SupportPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return TicketsSection();
 }
}

class StudentsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Students"));
 }
}

class AttendancePage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Attendance"));
 }
}

class AnalyticsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Analytics"));
 }
}

class TeamPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Team"));
 }
}

class CalendarPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Calendar"));
 }
}

class LeadsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Leads"));
 }
}

class VisitorsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Visitors"));
 }
}

class TicketsSection extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Padding(
   padding: const EdgeInsets.all(16.0),
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Text(
      'Tickets',
      style: TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
      ),
     ),
     SizedBox(height: 20),
     Expanded(child: _tabSection(context)),

    ],
   ),
  );
 }

 Widget _tabSection(BuildContext context) {
  return DefaultTabController(
   length: 3,
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
     SizedBox(     height: 50.0,
      width: 450,
       child: TabBar(
        // labelColor: Colors.blue,
        // unselectedLabelColor: Colors.grey,
        // indicatorColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        tabs: [
         Tab(text: "Unassigned"),
         Tab(text: "Assigned to Me"),
         Tab(text: "Solved"),
        ],
       ),
     ),        SizedBox(height: 20),

     Expanded(
       child: SizedBox(width: 1000,
         child: TabBarView(
          children: <Widget>[
           ListView.builder(
            itemCount: generateTicketList( Statuses: 'Unassigned').length,
            itemBuilder: (context, index) {
             final ticket = generateTicketList(Statuses: 'Unassigned')[index];
             return TicketCard(ticketCardModel: ticket,);
            },
           ),
           ListView.builder(
            itemCount: generateTicketList( Statuses: 'Assigned to Me').length,
            itemBuilder: (context, index) {
             final ticket = generateTicketList(Statuses: 'Assigned to Me')[index];
             return TicketCard(ticketCardModel: ticket,);
            },
           ),
           ListView.builder(
            itemCount: generateTicketList( Statuses: 'Solved').length,
            itemBuilder: (context, index) {
             final ticket = generateTicketList(Statuses: 'Solved')[index];
             return TicketCard(ticketCardModel: ticket,);
            },
           ),
          ],
         ),
       ),
     ),
    ],
   ),
  );
 }
}
class TicketCardModel {
 String title;
 String description;
 String status;
 String createBy;
 String date;
 TicketCardModel({required this.title, required this.createBy,required this.description, required this.status, required this.date});
}
List<TicketCardModel> generateTicketList({Statuses}) {
 List<String> statuses = ['Unassigned', 'Assigned to Me', 'Solved'];
 List<String> creators = ['Natasha Goswami', 'John Doe', 'Jane Smith'];
 List<String> titles = [
  'Cannot access the app',
  'UI not responsive',
  'Feature request: Dark mode',
  'Error on login',
  'App crashes on launch',
  'Payment gateway issue',
  'Slow loading time',
  'Data not syncing',
  'Push notifications not received',
  'User profile not updating',
  'Issue with settings',
  'Network connectivity issue',
  'Bug in chat feature',
  'Problem with media upload',
  'Error 404 on page',
  'Password reset issue',
  'Unexpected logout',
  'Feature request: Offline mode',
  'Security vulnerability',
  'Privacy settings issue',
  'Calendar not syncing',
  'Data export problem',
  'Customization options limited',
  'Error message not clear',
  'Language translation error',
  'Content missing on page',
  'Accessibility feature request',
  'Performance optimization needed',
  'Audio/video issue',
  'Feedback form not submitting'
 ];

 List<TicketCardModel> ticketList = List.generate(30, (index) {
  return TicketCardModel(
   title: titles[index % titles.length],
   description:
   'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. This is a description for ${titles[index % titles.length]}.',
   status: statuses[index % statuses.length],
   createBy: creators[index % creators.length],
   date: '${10 + index} August 2024',
  );
 }).where((e)=>e.status==Statuses).toList();

 return ticketList;
}



class TicketCard extends StatelessWidget {
 final TicketCardModel ticketCardModel;
 const TicketCard({Key? key, required this.ticketCardModel}) : super(key: key);
 @override
 Widget build(BuildContext context) {
  return Container(

decoration: BoxDecoration(
 color:Color(0xffE9EBF5),
 borderRadius: BorderRadius.circular(30),
),
   margin: EdgeInsets.symmetric(vertical: 10),
   child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Text(
       ticketCardModel.title,
       style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
       ),
      ),
      SizedBox(height: 10),
      Row(
       children: [
        Container(
         decoration: BoxDecoration(
          border: Border.all( color: Color(0xffC2C6D8),),
          borderRadius: BorderRadius.circular(50),
         ),
         padding: EdgeInsets.all(4),
         child: Row(
            children: [
              CircleAvatar(
               radius: 20,backgroundColor: AppColor.borderPrimary,
               // backgroundImage: NetworkImage(
               //  'https://via.placeholder.com/50',
               // ),
              ),
             SizedBox(width: 10),
             Text(ticketCardModel.createBy,style: TextStyle( color:  Color(0xff777C94)),),
            ],
          ),
        ),

        SizedBox(width: 20),
        Row(
         children: [
          Icon(Icons.date_range, size: 16, color: Colors.grey),
          SizedBox(width: 5),
          Text(ticketCardModel.date),
         ],
        ),
        SizedBox(width: 20),
        Container(
         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
         decoration: BoxDecoration(
          color:_getStatusColor(  ticketCardModel.status,),
          borderRadius: BorderRadius.circular(30),
         ),
         child: Text(
  ticketCardModel.status,
          style: TextStyle(color: Colors.white),
         ),
        ),
       ],
      ),
      SizedBox(height: 10),
      SizedBox(width: 800,
        child: Text(
            ticketCardModel.description,
            style: TextStyle(color: Colors.grey),
        ),
      ),
     ],
    ),
   ),
  );
 }
 Color _getStatusColor(String status) {
  switch (status) {
   case 'Unassigned':
    return Colors.red;
   case 'Assigned to Me':
    return Colors.orange;
   case 'Solved':
    return Colors.green;
   default:
    return Colors.grey;
  }
 }
}