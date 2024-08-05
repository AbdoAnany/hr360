import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../app.dart';
import 'core/utils/constants/colors.dart';
import 'di.dart';
import 'package:http/http.dart' as http;


//
Future<void> main() async {
 await initAppModule();
 // await makeRequest();
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




Future<void> makeRequest() async {
 var url = Uri.parse('https://1e9e-156-205-51-196.ngrok-free.app/api/users/all-personal-info');
 var response = await Dio().get(
  'https://1e9e-156-205-51-196.ngrok-free.app/api/users/all-personal-info',options: Options(
  headers: {
   'ngrok-skip-browser-warning': 'true',
  },
 )

  ,

 );

 print('Response status: ${response.statusCode}');
 print('body: ${response.data}');
}


//https://1e9e-156-205-51-196.ngrok-free.app/api/users/all-personal-info









