import 'package:flutter/material.dart';
import 'package:hr360/features/main_screen/page/AcademicsPage.dart';
import 'package:hr360/features/main_screen/page/AccountsPage.dart';
import 'package:hr360/features/main_screen/page/AnalyticsPage.dart';
import 'package:hr360/features/main_screen/page/AttendancePage.dart';
import 'package:hr360/features/main_screen/page/CalendarPage.dart';
import 'package:hr360/features/main_screen/page/DashboardPage.dart';
import 'package:hr360/features/main_screen/page/LeadsPage.dart';
import 'package:hr360/features/main_screen/page/StudentsPage.dart';
import 'package:hr360/features/main_screen/page/SupportPage.dart';
import 'package:hr360/features/main_screen/page/TeamPage.dart';
import 'package:hr360/features/main_screen/page/VisitorsPage.dart';
import 'package:hr360/features/main_screen/widget/header.dart';
import 'package:hr360/features/main_screen/widget/sidebar.dart';

import '../../main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

 @override
 _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 final PageController _pageController = PageController();

 int _currentIndex = 0;

 void _onItemTapped(int index) {
  setState(() {
   _currentIndex = index;
  });
  _pageController.jumpToPage(index);

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
           const AnalyticsPage(),
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
