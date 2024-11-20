
import 'package:flutter/material.dart';

import '../../shared/constants/defaults.dart';
import '../app_colors.dart';
import 'package:hr360/core/utils/constants/colors.dart';

class AppTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.textLight,

    suffixIconColor: AppColor.textLight,
    fillColor: AppColor.bgLight,
    filled: true,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(color: AppColor.titleLight),
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ).copyWith(color: AppColor.textGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),

    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColor.iconGrey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColor.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.textLight,
    suffixIconColor: AppColor.textLight,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(color: AppColor.titleLight),
    hintStyle: const TextStyle().copyWith(color: AppColor.textGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColor.textLight),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColor.iconLight),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColor.error),
    ),
  );
}
