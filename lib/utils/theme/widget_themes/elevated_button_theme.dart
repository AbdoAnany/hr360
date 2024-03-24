import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.light,
      backgroundColor: AppColor.primary,
      disabledForegroundColor: AppColor.darkGrey,
      disabledBackgroundColor: AppColor.buttonDisabled,
      side: const BorderSide(color: AppColor.primary),
      padding:  EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle:  TextStyle(fontSize: TSizes.fontSizeMd, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.light,
      backgroundColor: AppColor.primary,
      disabledForegroundColor: AppColor.darkGrey,
      disabledBackgroundColor: AppColor.darkerGrey,
      side: const BorderSide(color: AppColor.primary),
      padding:  EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle:  TextStyle(fontSize:  TSizes.fontSizeMd, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
