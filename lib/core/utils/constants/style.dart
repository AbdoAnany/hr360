import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';

import '../../../features/2_dash_border/presentation/pages/theme/app_colors.dart';

class AppStyle {
  static TextStyle font18Black400 = const TextStyle(
      color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w400);

  static TextStyle font14Gray400 = const TextStyle(
      color: AppColor.darkerGrey, fontSize: 14, fontWeight: FontWeight.w400);

  static BorderRadius borderRadius15 = BorderRadius.circular(25);

  static BoxDecoration coursesDecoration = BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(12));
  static BoxDecoration decorationPage =  BoxDecoration(
      color: AppColor.bgLight,
      // border: Border(
      //   top: BorderSide(width: 1, color: AppColor.borderPrimary),
      // ),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25)));
}
