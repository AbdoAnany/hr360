import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  // Border radius constants
  static BorderRadius get borderRadius5 => BorderRadius.circular(5.r);
  static BorderRadius get borderRadius10 => BorderRadius.circular(10.r);
  static BorderRadius get borderRadius15 => BorderRadius.circular(15.r);
  static BorderRadius get borderRadius20 => BorderRadius.circular(20.r);
  static BorderRadius get borderRadius30 => BorderRadius.circular(30.r);
  
  // Text styles
  static TextStyle get heading1 => TextStyle(
    fontSize: 24.spMin,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get heading2 => TextStyle(
    fontSize: 20.spMin,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get bodyText => TextStyle(
    fontSize: 14.spMin,
  );
  
  static TextStyle get smallText => TextStyle(
    fontSize: 12.spMin,
  );
  
  // Padding constants
  static EdgeInsets get padding8 => EdgeInsets.all(8.r);
  static EdgeInsets get padding16 => EdgeInsets.all(16.r);
  static EdgeInsets get paddingH16 => EdgeInsets.symmetric(horizontal: 16.r);
  static EdgeInsets get paddingV16 => EdgeInsets.symmetric(vertical: 16.r);
}
