// lib/domain/entities/course.dart
class Course {
  final String id;
  final String name;
  final int totalSubjects;
  final bool isOnline;

  Course({
    required this.id,
    required this.name,
    required this.totalSubjects,
    required this.isOnline,
  });
}
