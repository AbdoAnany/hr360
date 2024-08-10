

import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';

class AppStyle{


static  TextStyle font18Black400=const TextStyle(
  color: AppColor.black,
  fontSize: 18,
  fontWeight: FontWeight.w400
 );

static  TextStyle font14Gray400=const TextStyle(
  color: AppColor.darkerGrey,
  fontSize: 14,
  fontWeight: FontWeight.w400
 );

 static BorderRadius borderRadius15 =BorderRadius.circular(25);


 static BoxDecoration coursesDecoration= BoxDecoration(
 border: Border.all(
 color: Colors.grey
 ),
 borderRadius: BorderRadius.circular(12)
 );
}