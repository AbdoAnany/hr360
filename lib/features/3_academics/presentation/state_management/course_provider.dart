// lib/presentation/state_management/course_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/domain/entities/course.dart';
import '../../domain/usecases/get_courses.dart';

class CourseProvider with ChangeNotifier {
  final GetCourses getCourses;
  List<Course> _courses = [];
  bool _loading = false;

  CourseProvider(this.getCourses);

  List<Course> get courses => _courses;
  bool get loading => _loading;

  Future<void> loadCourses() async {
    _loading = true;
    notifyListeners();

    var temp = await getCourses();
    _courses.clear();
    _courses.addAllIf(true,temp);
    _loading = false;
    notifyListeners();

  }

  Future<void> addCourse(Course course) async {
    // Adding the course to Firebase Firestore
    final doc = FirebaseFirestore.instance.collection('courses').doc();
    await doc.set({
      'name': course.name,
      'totalSubjects': course.totalSubjects,
      'isOnline': course.isOnline,
    });

    // Adding the course to local state
    _courses.add(Course(
      id: doc.id,
      name: course.name,
      totalSubjects: course.totalSubjects,
      isOnline: course.isOnline,
    ));

    notifyListeners();
  }
}
