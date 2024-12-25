import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/model/class.dart';
import '../../data/repositories/FirebaseRepository.dart';
import '../pages/PrimarySchoolClassesPage.dart';
import 'ClassDialog.dart';

class PrimaryClassCard extends StatefulWidget {
  ClassRoomModel classRoom;
  PrimaryClassCard({
    Key? key,
    required this.classRoom,
  }) : super(key: key);

  @override
  State<PrimaryClassCard> createState() => _PrimaryClassCardState();
}

class _PrimaryClassCardState extends State<PrimaryClassCard> {
  final FirebaseRepository firebaseRepo = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 400.h,
      margin: EdgeInsets.all(8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.classRoom.backgroundColor!.withOpacity(0.8),
            widget.classRoom.backgroundColor!,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Optimized pattern overlay
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(
                widget.classRoom.backgroundColor!.withOpacity(0.15),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.classRoom.className ?? '',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => ClassDialog(
                                    existingClass: widget.classRoom,
                                    onSubmit: (classRoomModelRes) {
                                      setState(() {
                                        widget.classRoom = classRoomModelRes;
                                        firebaseRepo.updateClass(widget.classRoom);
                                      });
                                    },
                                  ),
                                ),
                                icon: const Icon(
                                  Iconsax.edit,
                                  size: 16,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Teacher: ${widget.classRoom.teacherName}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white.withOpacity(0.9),
                              height: 1.2,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.white, width: 2.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.classRoom.totalStudents}',
                            style: TextStyle(
                              fontSize: 24.sp,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Students',
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 1.2,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Text(
                              'Today\'s Subjects',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => SubjectDialog(
                                  existingSubjects: widget.classRoom.subjects!,
                                  onSubmit: (updatedSubjects) {
                                    widget.classRoom.subjects = updatedSubjects ?? [];
                                    firebaseRepo.updateClass(widget.classRoom);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Iconsax.add,
                              color: widget.classRoom.backgroundColor,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          itemCount: widget.classRoom.subjects?.length,
                          itemBuilder: (context, index) {
                            return SubjectListItem(
                              subject: widget.classRoom.subjects![index],
                              accentColor: widget.classRoom.backgroundColor!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// Custom Pattern Painter for Background
class PatternPainter extends CustomPainter {
  final Color baseColor;

  PatternPainter(this.baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw diagonal lines
    for (double i = 0; i < size.width + size.height; i += 20) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(0, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Subject List Item Widget
class SubjectListItem extends StatelessWidget {
  final SubjectModel subject;
  Color accentColor;

  SubjectListItem({
    Key? key,
    required this.subject,
    this.accentColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // accentColor = subject.name=='Break' ?Colors.black : accentColor;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            subject.icon,
            color: accentColor,
            size: 30,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                if (subject.teacher.isNotEmpty)
                  Text(
                    '${subject.teacher} ${subject.time.isNotEmpty ? '|' : ''} ${subject.time}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
