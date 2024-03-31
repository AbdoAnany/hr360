import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.dark,
      side: const BorderSide(color: AppColor.borderPrimary),
      textStyle:  TextStyle(fontSize:  TSizes.fontSizeMd, color: AppColor.black, fontWeight: FontWeight.w600),
      padding:  EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: TSizes.lg24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColor.light,
      side: const BorderSide(color: AppColor.borderPrimary),
      textStyle:  TextStyle(fontSize:  TSizes.fontSizeMd, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      padding:  EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: TSizes.lg24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
