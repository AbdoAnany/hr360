// lib/presentation/screens/courses_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants/style.dart';
import '../../../../di.dart';
import '../state_management/course_provider.dart';
import '../widgets/add_course.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        sl<CourseProvider>().loadCourses());


    super.initState();
  }
@override
  void dispose() {
  sl<CourseProvider>().dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCourseScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
        body:     ChangeNotifierProvider(
        create: (context) => sl<CourseProvider>(),
        child:    Consumer<CourseProvider>(

            builder: (context, provider, child) {
              print(provider.loading);
              print( provider.courses.length);
              if (provider.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: provider.courses.length,
                itemBuilder: (context, index) {
                  final course = provider.courses[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: AppStyle.coursesDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.name,
                          style: AppStyle.font18Black400,),
                        Text('Total No. of subjects: ${course.totalSubjects}',
                          style: AppStyle.font14Gray400,),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(12),
                            color: (course.isOnline?Colors.green:Colors.red).withOpacity(.07)
                          ),
                            child: Text(course.isOnline ? 'Online' : 'Offline',style: TextStyle(
color:    (course.isOnline?Colors.green:Colors.red)                         ),)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      );



  }
}
