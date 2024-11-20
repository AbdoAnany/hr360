import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/style.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import 'courses_screen.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        // color: Colors.transparent,
        width: 300,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AcademicsItem(
              title: 'Courses',
              color: Colors.red,
              icon: Icons.school,
              totalCount: 25, // Example dynamic total
              onTap: () => THelperFunctions.navigateToScreen(context: context,
                const CoursesScreen(),
              ),
            ),
            SizedBox(height: 16.h),
            AcademicsItem(
              title: 'Batches',
              color: Colors.green,
              icon: Icons.category,
              totalCount: 25, // Example dynamic total
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            AcademicsItem(
              title: 'Subjects',
              color: Colors.pink,
              icon: Icons.book,
              totalCount: 25, // Example dynamic total
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AcademicsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int totalCount;
  final VoidCallback onTap;

  const AcademicsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.totalCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: AppStyle.coursesDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(.07),
                  child: Icon(
                    icon,
                    size: 25,
                    color: color,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,
                  vertical: 12.0),
              child: Divider(
                color: Colors.grey.shade500,
              ),
            ),
            Text('Total $title: $totalCount')
          ],
        ),
      ),
    );
  }
}
