import 'package:flutter/material.dart';
import 'package:hr360/core/utils/theme/widget_themes/chip_theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/icon_button_theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di.dart';
import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Outfit',
    disabledColor: AppColor.grey,
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    iconButtonTheme: TIconButtonTheme.lightIconButtonTheme,
    scaffoldBackgroundColor: AppColor.bgLight,
    // appBarTheme: TAppBarTheme.lightAppBarTheme,
    // iconTheme: TIconTheme.lightIconTheme,
    // checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    // elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Outfit',
    disabledColor: AppColor.grey,
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColor.transparent,
    // appBarTheme: TAppBarTheme.darkAppBarTheme,
    // iconTheme: TIconTheme.darkIconTheme,
    // iconButtonTheme: TIconButtonTheme.darkIconButtonTheme,
    // checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    // elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool isDarkModeEnabled = true;
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    bool isDark;
    isDark = mode == ThemeMode.dark;
    getIt<SharedPreferences>().setBool('isDark', isDark);
    notifyListeners();
  }

  getThemeMode() {
    bool isDark = getIt<SharedPreferences>().getBool('isDark') ?? false;
    isDarkModeEnabled = isDark;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
