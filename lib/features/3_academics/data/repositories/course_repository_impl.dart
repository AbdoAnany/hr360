// lib/data/repositories/course_repository_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final FirebaseFirestore firestore;

  CourseRepositoryImpl(this.firestore);

  @override
  Future<List<Course>> getCourses() async {
    final snapshot = await firestore.collection('courses').get();
    return snapshot.docs.map((doc) => Course(
      id: doc.id,
      name: doc['name'],
      totalSubjects: doc['totalSubjects'],
      isOnline: doc['isOnline'],
    )).toList();
  }
}
