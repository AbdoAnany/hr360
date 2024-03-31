
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app.dart';

class TSizes {
  // Padding and margin sizes

  static init({context}){
     screenWidth = MediaQuery.of(context??Get.context).size.width;
     screenHeight = MediaQuery.of(context??Get.context).size.height;
     screenAspectRatio = MediaQuery.of(context??Get.context).size.aspectRatio;


  }
  static  double uiSW = 1512;
  static  double uiSH = 1198;
  static  double screenWidth = MediaQuery.of(Get.context).size.width;
  static  double screenHeight = MediaQuery.of(Get.context).size.height;
  static  double screenAspectRatio = MediaQuery.of(Get.context).size.aspectRatio;



  // Padding and margin sizes
  static  double xs4 = 4.0;
  static  double sm8 = 8.0;
  static  double md16 = 16.0;
  static  double lg24 = 24.0;
  static  double xl32 = 32.0;

  // Icon sizes
  static  double iconXs = 12.0.spMin;
  static  double iconSm = 16.0.spMin;
  static  double iconMd = 24.0.spMin;
  static  double iconLg = 32.0.spMin;

  // Font sizes
  static  double fontSizeSm = 14.0;
  static  double fontSizeMd = 16.0;
  static  double fontSizeLg = 18.0;

  // Button sizes
  static  double buttonHeight = 52.0;
  static  double buttonRadius = 12.0;
  static  double buttonWidth = 120.0;
  static  double buttonElevation = 4.0;

  // AppBar height
  static  double appBarHeight = 56.0;

  // Image sizes
  static  double imageThumbSize = 80.0.w;

  // Default spacing between sections
  static  double defaultSpace = 24.0.w;
  static  double spaceBtwItems = 16.0.w;
  static  double spaceBtwSections = 32.0.w;

  // Border radius
  static  double borderRadiusSm = 4.0.w;
  static  double borderRadiusMd = 8.0.w;
  static  double borderRadiusLg = 12.0.w;

  // Divider height
  static  double dividerHeight = 1.0.h;

  // Product item dimensions
  static  double productImageSize = 120.0.w;
  static  double productImageRadius = 16.0.w;
  static  double productItemHeight = 160.0.h;

  // Input field
  static  double inputFieldRadius = 12.0.sp;
  static  double spaceBtwInputFields = 16.0.w;

  // Card sizes
  static  double cardRadiusLg = 16.0.w;
  static  double cardRadiusMd = 12.0.w;
  static  double cardRadiusSm = 10.0.w;
  static  double cardRadiusXs = 6.0.w;
  static  double cardElevation = 2.0.w;

  // Image carousel height
  static  double imageCarouselHeight = 200.0.h;

  // Loading indicator size
  static  double loadingIndicatorSize = 36.0.w;

  // Grid view spacing
  static  double gridViewSpacing = 16.0.w;
}



