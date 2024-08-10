import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TIconButtonTheme {
  TIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      backgroundColor: AppColor.white,
      fixedSize: const Size(55, 55),
    ),
  );
  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColor.darkerGrey,
      elevation: 5,
      fixedSize: const Size(55, 55),
    ),
  );
}
