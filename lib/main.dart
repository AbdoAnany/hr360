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












class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

 @override
 Widget build(BuildContext context) {
  return Center(child: Text("Team"));
 }
}







