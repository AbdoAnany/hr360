import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hr360/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class TIconTheme {
  TIconTheme._();

  static IconThemeData lightIconTheme =
      IconThemeData(color: AppColor.black, size: TSizes.iconMd);
  static IconThemeData darkIconTheme =
      IconThemeData(color: AppColor.white, size: TSizes.iconMd);
}
