import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/model/class.dart';
import '../../data/repositories/FirebaseRepository.dart';
import '../pages/PrimarySchoolClassesPage.dart';
import 'ClassDialog.dart';

class PrimaryClassCard extends StatefulWidget {
  // Class details
  // final String className;
  // final int totalStudents;
  // final String teacherName;
  //  List<SubjectModel> currentSubjects;
  // final Color backgroundColor;
   ClassRoomModel classRoom;
   PrimaryClassCard({
    Key? key,
    required this.classRoom,
    // required this.totalStudents,
    // required this.teacherName,
    //  this.currentSubjects=const [],
    // this.backgroundColor = Colors.lightBlue,
  }) : super(key: key);

  @override
  State<PrimaryClassCard> createState() => _PrimaryClassCardState();
}

class _PrimaryClassCardState extends State<PrimaryClassCard> {
  final FirebaseRepository firebaseRepo = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return  Container(     width: 300,
      height: 370,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10,
        //     offset: Offset(0, 5),
        //   )
        // ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
          widget.classRoom.backgroundColor!.withOpacity(0.7),
               widget.classRoom.backgroundColor!.withOpacity(0.9),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Pattern Overlay
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(    widget.classRoom.backgroundColor!),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Section with Class Name and Students
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Class Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [


                              Expanded(
                                child: Text(
                                  widget.classRoom.className??'',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(onPressed: () => showDialog(context: context, builder:
                                  (context) => ClassDialog(existingClass: widget.classRoom,
                                onSubmit: (classRoomModelRes ) {
                                  setState(() {
                                    widget.classRoom=classRoomModelRes;
                                    firebaseRepo.updateClass(widget.classRoom.className!, widget.classRoom);
                                  });
                                },),),
                                icon:  const Icon(Iconsax.edit,size: 15, color: AppColor.white,),),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Teacher: ${widget.classRoom.teacherName}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),


                        ],
                      ),
                    ),

                    // Students Circle
                    Container(
                      width: 80,
                      height: 80,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.classRoom.totalStudents}',
                            style: TextStyle(
                              fontSize: 28,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Students',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Subjects Section
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Today\'s Subjects',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          IconButton(onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => SubjectDialog(
                                existingSubjects: widget.classRoom.subjects!,
                                onSubmit: (updatedSubjects) {
                                  widget.classRoom.subjects =   updatedSubjects??[];
                                  setState(() {});

                                },
                              ),
                            );


                          }, icon: Icon(Iconsax.add,color:widget.classRoom.backgroundColor ,size: 30,))
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount:  widget.classRoom.subjects?.length,
                          itemBuilder: (context, index) {
                            return SubjectListItem(
                              subject:  widget.classRoom.subjects![index],
                              accentColor:    widget.classRoom.backgroundColor!,
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
     this.accentColor=Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     accentColor = subject.name=='Break' ?Colors.black : accentColor;
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
                Text(
                  '${subject.teacher} | ${subject.time}',
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

