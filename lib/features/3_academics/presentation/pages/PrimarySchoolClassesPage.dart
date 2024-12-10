import 'package:flutter/material.dart';
import 'package:hr360/core/utils/helpers/helper_functions.dart';
import 'package:hr360/features/3_academics/presentation/pages/courses_screen.dart';

import '../../data/model/class.dart';
import '../../data/repositories/FirebaseRepository.dart';
import '../widgets/ClassDialog.dart';
import '../widgets/PrimaryClassCard.dart';

class PrimarySchoolClassesPage extends StatelessWidget {
  final FirebaseRepository firebaseRepo = FirebaseRepository();

  PrimarySchoolClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ClassRoomModel>>(
        stream: firebaseRepo.getAllClasses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final classes = snapshot.data!;
          return Wrap(
              children: List.generate(
            classes.length,
            (index) {
              final classRoom = classes[index];

              return GestureDetector(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => ClassDialog(
                  //     onSubmit: (updatedClass) {
                  //       firebaseRepo.updateClass(
                  //           classRoom.className, updatedClass);
                  //     },
                  //   ),
                  // );
                  THelperFunctions.navigateToScreen(const CoursesScreen());
                },
                child: PrimaryClassCard(classRoom: classRoom),
              );
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // tempSubjects.forEach((subject) async => await fireStoreSubjectsService.addSubject(subject));
          // fireStoreSubjectsService.addSubject();
          showDialog(
            context: context,
            builder: (context) => ClassDialog(
              onSubmit: (newClass) => firebaseRepo.addClass(newClass),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Subject Class
class SubjectModel {
  final String id;
  final String name;
  final String teacher;
  final String time;
  final String lastUpdated;
  final IconData icon;

  SubjectModel({
    required this.id,
    required this.name,
    required this.teacher,
    required this.time,
    required this.lastUpdated,
    required this.icon,
  });
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      teacher: json['teacher'] ?? '',
      lastUpdated: json['lastUpdated'] ?? '',
      time: json['time'] ?? '',
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }
  factory SubjectModel.fromJson2(Map<String, dynamic> json, id) {
    return SubjectModel(
      id: id ?? '',
      name: json['name'] ?? '',
      teacher: json['teacher'] ?? '',
      lastUpdated: json['lastUpdated'] ?? '',
      time: json['time'] ?? '',
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'teacher': teacher,
        'time': time,
        'lastUpdated': lastUpdated,
        'icon': icon.codePoint,
      };
}

class ClassRoomRepository {
  List<ClassRoomModel> getAllClasses() {
    return List.generate(8, (index) => ClassRoomModel.predefined(index));
  }

  ClassRoomModel getClassById(int id) {
    return ClassRoomModel.predefined(id);
  }
}
