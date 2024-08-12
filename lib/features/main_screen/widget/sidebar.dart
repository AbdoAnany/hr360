import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class Sidebar extends StatelessWidget {
 final Function(int) onItemTapped;
 final int currentIndex;

 Sidebar({required this.onItemTapped, required this.currentIndex});

 @override
 Widget build(BuildContext context) {
  return Container(
   width: 200,
  // color: Color(0xFFEEF2F5),
   color: AppColor.white,
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
