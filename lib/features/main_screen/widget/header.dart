import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Container(
   padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
   color: Colors.white,
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Text(
      'Welcome Pooran',
      style: TextStyle(
       fontSize: 24.sp,
       fontWeight: FontWeight.bold,
      ),
     ),
     Row(
      children: [
       Container(
        width: 200.w,
        child: TextField(
         decoration: InputDecoration(
          hintText: 'Search Dashboard',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8),
          ),
         ),
        ),
       ),
       SizedBox(width: 20.w),
       Icon(Icons.notifications_active_outlined, color: Colors.black),
       SizedBox(width: 20.w),
       Icon(Icons.chat_bubble_outline_outlined, color: Colors.black),
       SizedBox(width: 20.w),
       CircleAvatar(
       radius: 20,
       ),  SizedBox(width: 10.w),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         Text(
          'Welcome Pooran',
          style: TextStyle(
           fontSize: 14.sp,
           fontWeight: FontWeight.bold,
          ),
         ),    SizedBox(width: 8),
         Text(
          'Senior Admin',
          style: TextStyle(
           color: Colors.grey,
           fontSize: 12.sp,
          ),
         ),
        ],
       ),
      ],
     ),
    ],
   ),
  );
 }
}
