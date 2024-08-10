
import 'package:equatable/equatable.dart';

import '../../domain/entities/course.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesEvent extends CourseEvent {}

class AddCourseEvent extends CourseEvent {
  final Course course;

  const AddCourseEvent(this.course);

  @override
  List<Object> get props => [course];
}
