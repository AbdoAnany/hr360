
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
  static  double uiSW = 400;
  static  double uiSH = 900;
  static  double screenWidth = MediaQuery.of(Get.context).size.width;
  static  double screenHeight = MediaQuery.of(Get.context).size.height;
  static  double screenAspectRatio = MediaQuery.of(Get.context).size.aspectRatio;



  // Padding and margin sizes
  static  double xs = 4.0.r;
  static  double sm = 8.0.r;
  static  double md = 16.0.r;
  static  double lg = 24.0.r;
  static  double xl = 32.0.r;

  // Icon sizes
  static  double iconXs = 12.0.spMin;
  static  double iconSm = 16.0.spMin;
  static  double iconMd = 24.0.spMin;
  static  double iconLg = 32.0.spMin;

  // Font sizes
  static  double fontSizeSm = 14.0.r;
  static  double fontSizeMd = 16.0.r;
  static  double fontSizeLg = 18.0.r;

  // Button sizes
  static  double buttonHeight = 52.0.r;
  static  double buttonRadius = 12.0.r;
  static  double buttonWidth = 120.0.r;
  static  double buttonElevation = 4.0.r;

  // AppBar height
  static  double appBarHeight = 56.0.r;

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



