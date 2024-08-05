// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// class SizeConfig {
//   static double screenWidth;
//   static double screenHeight;
//   static double defaultSize;
//   static Orientation orientation;
//   // ignore: unused_field
//   static MediaQueryData _mediaQueryData;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//     orientation = MediaQuery.of(context).orientation;
//     log('the hight of the device $screenHeight , and width $screenWidth');
//     defaultSize = orientation == Orientation.landscape
//         ? screenHeight * .024
//         : screenWidth * .024;
//   }
// }
