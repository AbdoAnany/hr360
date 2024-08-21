import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/style.dart';
import '../../../../di.dart';
import '../manager/course_bloc.dart';
import '../manager/course_event.dart';
import '../manager/course_state.dart';
import '../widgets/add_course.dart';
class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context) => sl<CourseBloc>(),
    child: const CoursesView());
  }
}

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesView> {
  @override
  void initState() {
    super.initState();
    // Triggering the LoadCoursesEvent when the screen initializes
    context.read<CourseBloc>().add(LoadCoursesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCourseScreen()),
          ).then((_) {
            // Reload courses when returning from the AddCourseScreen
            context.read<CourseBloc>().add(LoadCoursesEvent());
          });
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CourseLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width/200).toInt(),
             //   childAspectRatio: 3 / 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                final course = state.courses[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AppStyle.coursesDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: AppStyle.font18Black400,
                      ),
                      Text(
                        'Total No. of subjects: ${course.totalSubjects}',
                        style: AppStyle.font14Gray400,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: (course.isOnline ? Colors.green : Colors.red)
                              .withOpacity(.07),
                        ),
                        child: Text(
                          course.isOnline ? 'Online' : 'Offline',
                          style: TextStyle(
                            color:
                            (course.isOnline ? Colors.green : Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          if (state is CourseError) {
            return Center(child: Text(state.message));
          }

          return Center(child: Text('No courses found.'));
        },
      ),
    );
  }
}
