import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/attendance_grid_view.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../di.dart';
import '../../../../../4_user/presentation/manager/bloc/user_bloc.dart';
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


    return    const AttendanceGridView();
  }
}
class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //   appBar: AppBar(title: Text("User Management")),
      body: AttendanceGridView(),
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
