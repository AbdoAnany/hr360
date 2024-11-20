
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/constants/defaults.dart';
import 'package:hr360/core/utils/constants/colors.dart';


import 'widgets/app_text_form_field_theme.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.bgLight,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColor.bgSecondayLight,
        surfaceTintColor: AppColor.bgSecondayLight,
      ),
      primaryColor: AppColor.primary,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(
              bodyColor: AppColor.titleLight,
              displayColor: AppColor.titleLight)
          .copyWith(
            bodyLarge: const TextStyle(color: AppColor.textLight),
            bodyMedium: const TextStyle(color: AppColor.textLight),
            bodySmall: const TextStyle(color: AppColor.textLight),
          ),
      iconTheme: const IconThemeData(color: AppColor.iconLight),
      dividerColor: AppColor.highlightLight,
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColor.highlightLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 56),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColor.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDefaults.borderRadius),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.titleLight,
          minimumSize: const Size(100, 56),
          padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding, vertical: AppDefaults.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          ),
          side: BorderSide(color: AppColor.highlightLight, width: 2),
        ),
      ),
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      expansionTileTheme:
      const ExpansionTileThemeData(shape: const RoundedRectangleBorder()),
      badgeTheme:
          BadgeThemeData(backgroundColor: AppColor.error, smallSize: 8),
    );
  }
}
