
import 'package:flutter/material.dart';

class AppColors{

  static const Color primaryColor = Color(0xFFFFC268);
  static const Color secondaryBgColor = Color(0xFF171717);

  static const Color selectionColor = Color(0xFFC25F30);
  static const Color shadowSelectionColor = Color.fromRGBO(194, 95, 48, .1);

  static const Color primaryFontColor = Color(0xFFFFFFFF);
  static const Color secondaryFontColor = Color(0xFF999999);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color dividerColor = Color(0xFF262626);
  static const Color darkGreyColor = Color(0xFF757575);

}

class AppStyle{

  static  TextStyle headingStyle = TextStyle(
    fontSize: 32,
    color:AppColors. whiteColor,
    fontWeight: FontWeight.normal
  );
  static  TextStyle titleStyle = TextStyle(
    fontSize: 18,
    color:AppColors. whiteColor,
      // fontFamily: "inter",

      fontWeight: FontWeight.normal
  );
  static  TextStyle titleGreyStyle = TextStyle(
    fontSize: 14,
    color:AppColors. secondaryFontColor,
    fontWeight: FontWeight.normal
  );  static  TextStyle titleBlackStyle = TextStyle(
    fontSize: 14,
    color:AppColors. blackColor,
    fontWeight: FontWeight.normal
  );
  static  TextStyle titleWhiteStyle = TextStyle(
    fontSize: 14,
    color:AppColors. whiteColor,
    height: 2.6,
    fontWeight: FontWeight.normal
  );

  static  TextStyle subTitleStyle14 = TextStyle(
    fontSize: 14,
    color:AppColors. secondaryFontColor,
    fontWeight: FontWeight.normal
  );
  static  TextStyle subTitleStyle12 = TextStyle(
    fontSize: 12,
    color:AppColors. secondaryFontColor,
    fontWeight: FontWeight.normal
  );

}