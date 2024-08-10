import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColor.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColor.black),
    selectedColor: AppColor.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColor.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColor.darkerGrey,
    labelStyle: TextStyle(color: AppColor.white),
    selectedColor: AppColor.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColor.white,
  );
}
