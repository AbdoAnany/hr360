import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../presentation/pages/PrimarySchoolClassesPage.dart';

// Subject Model
// class SubjectModel {
//   final String name;
//   final String teacher;
//   final String time;
//   final IconData icon;
//
//   SubjectModel({
//     required this.name,
//     required this.teacher,
//     required this.time,
//     required this.icon,
//   });
//
//   // Optional: Convert to and from JSON
//   factory SubjectModel.fromJson(Map<String, dynamic> json) {
//     return SubjectModel(
//       name: json['name'],
//       teacher: json['teacher'],
//       time: json['time'],
//       icon: _getIconFromString(json['icon']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'teacher': teacher,
//       'time': time,
//       'icon': _getIconName(icon),
//     };
//   }
//
//   // Helper method to convert icon to string
//   static String _getIconName(IconData iconData) {
//     return iconData.toString().split('.').last;
//   }
//
//   // Helper method to convert string back to icon
//   static IconData _getIconFromString(String iconName) {
//     return {
//       'calculate': Icons.calculate,
//       'book': Icons.book,
//       'palette': Icons.palette,
//       'science': Icons.science,
//       'history': Icons.history,
//       'music_note': Icons.music_note,
//       'public': Icons.public,
//       'sports': Icons.sports,
//       'computer': Icons.computer,
//       'menu_book': Icons.menu_book,
//       'theater_comedy': Icons.theater_comedy,
//       'sport': Icons.sports_rugby_outlined,
//     }[iconName] ?? Icons.subject;
//   }
// }

// Class Model
class ClassRoomModel {
  final String? id;
  final String? className;
  final String? teacherName;
  final int? totalStudents;
  late final List<SubjectModel>? subjects;
  final Color? backgroundColor;

  ClassRoomModel({
    required this.id,
    required this.className,
     this.teacherName='',
     this.totalStudents=0,
     this.subjects=const [],
     this.backgroundColor=Colors.black,
  });

  // Factory method to create predefined classes
  factory ClassRoomModel.predefined(int index) {
    return ClassRoomModel(
      id: 0.toString(),
      className: getClassName(index),
      teacherName: getTeacherName(index),
      totalStudents: 20 + index * 2,
      subjects: getCurrentSubjects(index),
      backgroundColor: getBackgroundColor(index),
    );
  }

  // Optional: Convert to and from JSON
  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      id: json['id'],
      className: json['className'],
      teacherName: json['teacherName'],
      totalStudents: json['totalStudents'],
      subjects: (json['subjects'] as List)
          .map((subject) => SubjectModel.fromJson(subject))
          .toList(),
      backgroundColor: Color(json['backgroundColor']),
    );
  } // Optional: Convert to and from JSON
  factory ClassRoomModel.fromJson2(
      Map<String, dynamic> json, String documentId) {
    return ClassRoomModel(
      id: json['id'] ?? '',
      className: json['className'] ?? '',
      teacherName: json['teacherName'] ?? '',
      totalStudents: json['totalStudents'] ?? 0,
      subjects: (json['subjects'] as List?)
              ?.map((subject) => SubjectModel.fromJson(subject))
              ?.toList() ??
          [],
      backgroundColor: Color(json['backgroundColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'className': className,
      'teacherName': teacherName,
      'totalStudents': totalStudents,
      'subjects': subjects?.map((subject) => subject.toJson()).toList(),
      'backgroundColor': backgroundColor?.value,
    };
  }
}

// Utility Methods
String getClassName(int index) {
  final classes = [
    'فصل 1/1',
    'فصل 1/2',
    'فصل 2/1',
    'فصل 2/2',
    'Sunshine Class',
    'Rainbow Class',
    'Adventure Class',
    'Discovery Class',
    'Class  A1',
    'Class  A2',
    'Class  B1',
    'Class  B2',
  ];
  return classes[index];
}

String getTeacherName(int index) {
  final teachers = [
    'أ/ محمد نجيب',
    'أ/ هبة عبدالله',
    'أ/وليد زبادي',
    'أ/عمر احمد',
    'Ms. Johnson',
    'Mr. Smith',
    'Ms. Garcia',
    'Mr. Williams'
        'Ms. ’heba Mahmoud',
    'Mr. Mahmoud Omar',
    'Ms. Ala Omar Ali',
    'Mr. Williams'
  ];
  return teachers[index];
}

List<SubjectModel> getCurrentSubjects(int index) {
  final subjectSets = [
    [
      SubjectModel(
        name: 'Arabic',
        teacher: 'Ms. Johnson',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.translate,
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        name: 'English',
        teacher: 'Mr. Brown',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.book,
        lastUpdated: '',
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Art',
        teacher: 'Ms. Lee',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.palette,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Science',
        teacher: 'Mr. Smith',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.science,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'History',
        teacher: 'Ms. Wilson',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.history,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Music',
        teacher: 'Mr. Davis',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.music_note,
      ),
    ],
    [     SubjectModel(
      name: 'Arabic',
      teacher: 'Ms. Johnson',
      time: '9:00 AM - 9:45 AM',
      icon: Icons.translate,
      id: Random().nextInt(100000).toString(),
      lastUpdated: '',
    ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),   SubjectModel(
      id: Random().nextInt(100000).toString(),
      lastUpdated: '',
      name: 'Drama',
      teacher: 'Ms. Anderson',
      time: '10:30 AM - 11:15 AM',
      icon: Icons.theater_comedy,
    ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'Science',
      //   teacher: 'Mr. Smith',
      //   time: '9:00 AM - 9:45 AM',
      //   icon: Icons.science,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'History',
      //   teacher: 'Ms. Wilson',
      //   time: '9:45 AM - 10:30 AM',
      //   icon: Icons.history,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'Music',
      //   teacher: 'Mr. Davis',
      //   time: '10:30 AM - 11:15 AM',
      //   icon: Icons.music_note,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'Break',
      //   teacher: 'Break',
      //   time: '11:15 AM - 11:30 AM',
      //   icon: Iconsax.timer_pause,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'Mathematics',
      //   teacher: 'Ms. Johnson',
      //   time: '9:00 AM - 9:45 AM',
      //   icon: Icons.calculate,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'English',
      //   teacher: 'Mr. Brown',
      //   time: '9:45 AM - 10:30 AM',
      //   icon: Icons.book,
      // ),
      // SubjectModel(
      //   id: Random().nextInt(100000).toString(),
      //   lastUpdated: '',
      //   name: 'Art',
      //   teacher: 'Ms. Lee',
      //   time: '10:30 AM - 11:15 AM',
      //   icon: Icons.palette,
      // ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),   SubjectModel(
      id: Random().nextInt(100000).toString(),
      lastUpdated: '',
      name: 'Drama',
      teacher: 'Ms. Anderson',
      time: '10:30 AM - 11:15 AM',
      icon: Icons.theater_comedy,
    ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Johnson',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'English',
        teacher: 'Mr. Brown',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Art',
        teacher: 'Ms. Lee',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.palette,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Science',
        teacher: 'Mr. Smith',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.science,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'History',
        teacher: 'Ms. Wilson',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.history,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Music',
        teacher: 'Mr. Davis',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.music_note,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Science',
        teacher: 'Mr. Smith',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.science,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'History',
        teacher: 'Ms. Wilson',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.history,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Music',
        teacher: 'Mr. Davis',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.music_note,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Johnson',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'English',
        teacher: 'Mr. Brown',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Art',
        teacher: 'Ms. Lee',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.palette,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Johnson',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'English',
        teacher: 'Mr. Brown',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Art',
        teacher: 'Ms. Lee',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.palette,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Science',
        teacher: 'Mr. Smith',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.science,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'History',
        teacher: 'Ms. Wilson',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.history,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Music',
        teacher: 'Mr. Davis',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.music_note,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Science',
        teacher: 'Mr. Smith',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.science,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'History',
        teacher: 'Ms. Wilson',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.history,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Music',
        teacher: 'Mr. Davis',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.music_note,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Johnson',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'English',
        teacher: 'Mr. Brown',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Art',
        teacher: 'Ms. Lee',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.palette,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
    ],
    [
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Literature',
        teacher: 'Mr. Williams',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.menu_book,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Mathematics',
        teacher: 'Ms. Rodriguez',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.calculate,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Drama',
        teacher: 'Ms. Anderson',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.theater_comedy,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Break',
        teacher: 'Break',
        time: '11:15 AM - 11:30 AM',
        icon: Icons.sports_rugby_outlined,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Geography',
        teacher: 'Ms. Garcia',
        time: '9:00 AM - 9:45 AM',
        icon: Icons.public,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Physical Education',
        teacher: 'Coach Martin',
        time: '9:45 AM - 10:30 AM',
        icon: Icons.sports,
      ),
      SubjectModel(
        id: Random().nextInt(100000).toString(),
        lastUpdated: '',
        name: 'Computer',
        teacher: 'Mr. Taylor',
        time: '10:30 AM - 11:15 AM',
        icon: Icons.computer,
      ),
    ]
  ];
  return subjectSets[index];
}

Color getBackgroundColor(int index) {
  final colors = [
    Colors.lightBlue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.deepPurple,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.cyan,
    Colors.pink,
    Colors.amber,
  ];
  return colors[
      index % colors.length]; // Ensures it loops back for larger indices
}

// Utility color conversion methods
String _getColorName(Color color) {
  final colorMap = {
    Colors.lightBlue: 'lightBlue',
    Colors.green: 'green',
    Colors.orange: 'orange',
    Colors.purple: 'purple',
    Colors.red: 'red',
    Colors.yellow: 'yellow',
    Colors.teal: 'teal',
    Colors.cyan: 'cyan',
    Colors.pink: 'pink',
    Colors.amber: 'amber',
  };
  return colorMap[color] ?? 'unknown';
}

Color _getColorFromString(String colorName) {
  final colorMap = {
    'lightBlue': Colors.lightBlue,
    'green': Colors.green,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'red': Colors.red,
    'yellow': Colors.yellow,
    'teal': Colors.teal,
    'cyan': Colors.cyan,
    'pink': Colors.pink,
    'amber': Colors.amber,
  };
  return colorMap[colorName] ?? Colors.blue; // Default fallback color
}

// Example Usage
class ClassRoomRepository {
  List<ClassRoomModel> getAllClasses() {
    return List.generate(8, (index) => ClassRoomModel.predefined(index));
  }

  ClassRoomModel getClassById(int id) {
    return ClassRoomModel.predefined(id);
  }
}
