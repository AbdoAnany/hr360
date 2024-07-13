import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AttendanceGridView extends StatefulWidget {
  AttendanceGridView({Key? key}) : super(key: key);

  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              AttendanceHeaderItem(
                title: 'Search by name, role, department...',
                icon: Iconsax.search_normal,
              ),
              SizedBox(
                width: 16.w,
              ),
              AttendanceHeaderItem(
                title: 'Filter',
                icon: Iconsax.filter_search,
              ),
              Spacer(),
              AttendanceHeaderItem(
                title: 'All Departments',
                icon: Iconsax.arrow_bottom,
              ),
              SizedBox(
                width: 16.w,
              ),
              AttendanceHeaderItem(
                title: '13 Jan, 2024',
                icon: Iconsax.calendar_1,
              ),
              SizedBox(
                width: 16.w,
              ),
              AttendanceHeaderItem(
                title: 'Export CSV',
                icon: Iconsax.export,
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Date",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 6,
                    child: Text(
                      "Employee",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Role",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Employment Type",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Status",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Check In",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Check Out",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "Over Time",
                      style: TextStyle(fontSize: 16.w, color: Colors.black),
                    )),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 432.h,
            child: ListView.separated(
              itemCount: 12,
              itemBuilder: (c, i) {
                return AttendanceBodyItem();
              },
              separatorBuilder: (c, i) => Divider(
                color: Colors.black.withOpacity(.2),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AttendanceHeaderItem extends StatelessWidget {
  const AttendanceHeaderItem(
      {Key? key, this.title = "", this.icon = Iconsax.activity})
      : super(key: key);

// 'Search by name, role, department...'
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        //  color : Color.fromRGBO(33, 34, 45, 1),
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, .5),
          width: 0.2,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Icon(icon),
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                //   fontFamily: 'Outfit',
                fontSize: 16.w,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}

class AttendanceBodyItem extends StatelessWidget {
  const AttendanceBodyItem(
      {Key? key, this.title = "", this.color = const Color(0xff00000)})
      : super(key: key);

// 'Search by name, role, department...'
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
          //  color: Color(0xffF5F5F5),
          //   borderRadius: BorderRadius.circular(12),
          ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                "13/01",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 6,
              child: Row(
                children: [
                  Image.asset(
                    "assets/weman.png",
                    width: 40.w,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Aisha Doe",
                    style: TextStyle(fontSize: 16.w, color: Colors.black),
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Role",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Employment Type",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Status",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Check In",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Check Out",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 3,
              child: Text(
                "Over Time",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
        ],
      ),
    );
  }
}
