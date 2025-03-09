// import 'package:flutter/material.dart';
//
// import '../../../../../core/utils/constants/colors.dart';
// import '../responsive.dart';
// import '../shared/constants/defaults.dart';
// import '../shared/widgets/sidemenu/tab_sidebar.dart';
// import 'dashboard/dashboard_page.dart';
//
// // final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
//
// class EntryPoint extends StatelessWidget {
//   const EntryPoint({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(color: AppColor.bgLight,
//       child: Row(
//         children: [
//           //  if (Responsive.isDesktop(context)) const Sidebar(),
//           // if (Responsive.isDesktop(context)) const TabSidebar(),
//           Expanded(
//             child: ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppDefaults.padding * (Responsive.isMobile(context) ? 1 : 1.5),),
//                   child: DashboardPage(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     )
//     ;
//   }
// }
