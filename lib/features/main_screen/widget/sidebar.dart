import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/routing/routes_gen.dart';

class Sidebar extends StatelessWidget {
 final Function(AppRoutes) onItemTapped;
 final AppRoutes currentRoute;

 const Sidebar({
  Key? key,
  required this.onItemTapped,
  required this.currentRoute,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
  return Container(
   width: 200,
   color: Colors.white,
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Column(
      children: [
       const SizedBox(height: 20),
       const ListTile(
        title: Text(
         'TIPS-G',
         style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
         ),
        ),
       ),
       _buildNavItems(),
      ],
     ),
    ],
   ),
  );
 }

 Widget _buildNavItems() {
  final List<NavItem> items = [
   NavItem(Iconsax.category, 'Dashboard', AppRoutes.dashboard),
   NavItem(Iconsax.activity, 'Academics', AppRoutes.academics),
   NavItem(Iconsax.money, 'Accounts', AppRoutes.accounts),
   NavItem(Iconsax.message, 'Support', AppRoutes.support),
   NavItem(Iconsax.user, 'Students', AppRoutes.employees),
   NavItem(Iconsax.calendar, 'Attendance', AppRoutes.attendance),
   NavItem(Iconsax.graph, 'Analytics', AppRoutes.analytics),
   NavItem(Iconsax.people, 'Team', AppRoutes.accounts),
   NavItem(Iconsax.calendar, 'Calendar', AppRoutes.calendar),
   NavItem(Iconsax.link, 'Leads', AppRoutes.leads),
   NavItem(Iconsax.people, 'Visitors', AppRoutes.visitors),
  ];

  return Column(
   children: items.map((item) => _sidebarItem(item)).toList(),
  );
 }

 Widget _sidebarItem(NavItem item) {
  return ListTile(
   leading: Icon(
    item.icon,
    color: currentRoute == item.route ? Colors.blue : Colors.black,
   ),
   title: Text(
    item.label,
    style: TextStyle(
     color: currentRoute == item.route ? Colors.blue : Colors.black,
    ),
   ),
   onTap: () => onItemTapped(item.route),
  );
 }
}

class NavItem {
 final IconData icon;
 final String label;
 final AppRoutes route;

 NavItem(this.icon, this.label, this.route);
}