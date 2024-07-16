import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/attendance_grid_view.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../date/DashBoardCard.dart';

List<DashBoardCard> cards = [
  DashBoardCard(
      icon: Iconsax.briefcase,
      title: "Total Workforce",
      present: 10,
      subTitle: "vs last month",
      count: 150),
  DashBoardCard(
      icon: Iconsax.activity,
      title: "Present Workforce",
      present: 20,
      subTitle: "vs last month",
      count: 125),
  DashBoardCard(
      icon: Iconsax.information,
      title: "Absent Workforce",
      present: -10,
      subTitle: "vs last month",
      count: 15),
  DashBoardCard(
      icon: Iconsax.clock,
      title: "Late arrivals",
      present: 7,
      subTitle: "vs last month",
      count: 5),
  DashBoardCard(
      icon: Iconsax.bus,
      title: "On leave",
      present: 10,
      subTitle: "vs last month",
      count: 3),
];

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        // SizedBox(
        //   height: 20.h,
        // ),
        // Wrap(
        //     runSpacing: TSizes.lg24,
        //     spacing: TSizes.lg24,
        //     crossAxisAlignment: WrapCrossAlignment.start,
        //     children: cards
        //         .map(
        //           (e) => Container(
        //             padding: EdgeInsets.symmetric(
        //                 horizontal: 24.w, vertical: 24.h),
        //             width: 224.w,
        //             //   height: 168.h,
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(12),
        //                 border: Border.all(
        //                   color: Colors.grey,
        //                 )),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Container(
        //                       padding: EdgeInsets.all(TSizes.sm8),
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(12),
        //                           border: Border.all(
        //                             color: Colors.grey,
        //                           )),
        //                       child: Icon(
        //                         e.icon,
        //                         color: AppColor.primary,
        //                       ),
        //                     ),
        //                     RichText(
        //                       text: TextSpan(
        //                         style: TextStyle(
        //                           fontSize: 12.0.sp,
        //                           color: Colors.black,
        //                         ),
        //                         children: <TextSpan>[
        //                           TextSpan(
        //                             text: '${e.present?.abs()}%',
        //                             style: TextStyle(
        //                                 fontSize: 12.0.sp,
        //                                 fontWeight: FontWeight.w500,
        //                                 color: e.present! > 0
        //                                     ? AppColor.success
        //                                     : AppColor.error),
        //                           ),
        //                           TextSpan(
        //                             text: '  ${e.subTitle}',
        //                             style: TextStyle(
        //                               fontSize: 12.0.sp,
        //                               //  fontStyle: FontStyle.italic,
        //                               fontWeight: FontWeight.w300,
        //                               // decoration: TextDecoration.underline,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 16.h,
        //                 ),
        //                 Text(
        //                   "${e.title}",
        //                   style: TextStyle(
        //                     fontSize: 12.sp,
        //                     fontWeight: FontWeight.w300,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 4.h,
        //                 ),
        //                 Text(
        //                   "${e.count}",
        //                   style: TextStyle(
        //                     fontSize: 32.sp,
        //                     fontWeight: FontWeight.w600,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         )
        //         .toList()),
        // SizedBox(
        //   height: 40.h,
        // ),
        Expanded(child: AttendanceGridView())
      ],
    );
  }
}

List damyList = [
  {
    "id": 1,
    "user_id": 18,
    "first_name": "Admin",
    "last_name": "User",
    "email": "admin@example.com",
    "phone": "1234567890",
    "address": "123 Admin St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "male",
    "roles": "admin",
    "state": "active"
  },
  {
    "id": 9,
    "user_id": 5,
    "first_name": "Admin1",
    "last_name": "User",
    "email": "admin1@example.com",
    "phone": "1234567890",
    "address": "123 Admin St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "male",
    "roles": "student",
    "state": "active"
  },
  {
    "id": 10,
    "user_id": 9,
    "first_name": "Admin1",
    "last_name": "User",
    "email": "admin1@example.com",
    "phone": "1234567890",
    "address": "123 Admin2 St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "female",
    "roles": "student",
    "state": "active"
  },
  {
    'id': 11,
    "user_id": 13,
    "first_name": "Sara",
    "last_name": "User",
    "email": "Sara@example.com",
    "phone": "01115485741544",
    "address": "123 Admin2 St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "female",
    "roles": "teacher",
    "state": "active"
  },
  {
    "id": 12,
    "user_id": 15,
    "first_name": "Ahmed",
    "last_name": 'Kaled',
    "email": "Ahmed@example.com",
    "phone": "01115485741544",
    "address": "123 Ahmed St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "male",
    "roles": "student",
    "state": "active"
  },
  {
    "id": 13,
    "user_id": 16,
    "first_name": "Ali",
    "last_name": "Omar",
    "email": "Ali@example.com",
    "phone": "01115485741544",
    "address": "123 Ali St, Admin City, Admin State",
    "national_id": "A12345678",
    "gender": "male",
    "roles": "student",
    "state": " not active"
  }
];
