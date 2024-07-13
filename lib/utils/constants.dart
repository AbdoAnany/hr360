import 'package:flutter/material.dart';

const kMessage = 'message';
const kToken = 'token';
const kUser = 'user';
const kProfile = 'profile';
const kAppLogo = 'assets/images/falsher_logo.png';
const kLoggedWithSocial = 'logged with social';
const kIsLoggedIn = 'logged in';
const kIsLoggedInSkipped = 'skipped';
const kCar = 'car';
const kExceptionMessage = 'لقد حدث خطأ ما برجاء المحاوله في وقت لاحق';
const kOnboardingSeen = 'on boarding seen';
const kPasswordErrorMessage = 'كلمه المرور يجب ان تتكون من حروف ورموز';
const kConfirmPasswordErrorMessage = 'كلمتي المرور يجب ان يكونوا متطابقتان';
const kEmailErrorMessage = 'شكل بريد الكتروني خاطيء';
const kFieldEmptyErrorMessage = 'هذا الحقل فارغ';
const kLogoImage = 'assets/images/falsher_logo.png';
const kPrimaryColor = Color(0xFF2B32B2);
const kSecondaryColor = Color(0xFFD6D6D6);

// ThemeData appTheme = ThemeData(
//     accentColor: kPrimaryColor,
//     appBarTheme: appBarTheme,
//     brightness: appBrightness,
//     fontFamily:'Tajawal',
//     backgroundColor: Colors.grey[300],
//     iconTheme: IconThemeData(color:kSecondaryColor));
const kTitleStyle = TextStyle(
  fontFamily: 'Tajawal',
  fontSize: 24,
  color: Color(0xff2c3e50),
  fontWeight: FontWeight.w700,
);

const kSubTitleStyle = TextStyle(
  fontFamily: 'Tajawal',
  fontSize: 16,
  color: Color(0xff2c3e50),
);
Brightness appBrightness = Brightness.light;

AppBarTheme appBarTheme = AppBarTheme(
    color: kPrimaryColor,
    iconTheme: IconThemeData(color: kPrimaryColor),
    elevation: 0.0,
    titleTextStyle: TextStyle(color:  kPrimaryColor));
