// lib/domain/repositories/course_repository.dart

import 'package:hr360/features/3_academics/domain/domain/entities/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourses();
}
