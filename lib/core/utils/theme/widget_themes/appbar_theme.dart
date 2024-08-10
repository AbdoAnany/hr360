import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/sizes.dart';

import '../../constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColor.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AppColor.black, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: TSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: AppColor.black),
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColor.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AppColor.white, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: TSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: AppColor.white),
  );
}
