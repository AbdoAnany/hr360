// lib/bloc/course_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/course.dart';
import '../../domain/usecases/get_courses.dart';
import 'course_event.dart';
import 'course_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourses getCourses;

  CourseBloc(this.getCourses) : super(CourseInitial()) {
    on<LoadCoursesEvent>(_onLoadCourses);
    on<AddCourseEvent>(_onAddCourse);
  }

  Future<void> _onLoadCourses(LoadCoursesEvent event, Emitter<CourseState> emit) async {
    emit(CourseLoading());

    try {
      final courses = await getCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError("Failed to load courses"));
    }
  }

  Future<void> _onAddCourse(AddCourseEvent event, Emitter<CourseState> emit) async {
    if (state is CourseLoaded) {
      try {
        final course = event.course;
        // Adding the course to Firebase Firestore
        final doc = FirebaseFirestore.instance.collection('courses').doc();
        await doc.set({
          'name': course.name,
          'totalSubjects': course.totalSubjects,
          'isOnline': course.isOnline,
        });

        // Adding the course to the list of courses in the current state
        final updatedCourses = List<Course>.from((state as CourseLoaded).courses)
          ..add(Course(
            id: doc.id,
            name: course.name,
            totalSubjects: course.totalSubjects,
            isOnline: course.isOnline,
          ));

        emit(CourseAdded(updatedCourses));
        emit(CourseLoaded(updatedCourses));
      } catch (e) {
        emit(CourseError("Failed to add course"));
      }
    }
  }
}
