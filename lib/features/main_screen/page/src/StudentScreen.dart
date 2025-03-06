import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:hr360/features/main_screen/page/src/user_service.dart';
import '../../../../core/service/firebase_handler.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ChatScreen.dart';
import 'ChatService.dart';



class StudentScreen extends StatefulWidget {
  final userId;

  const StudentScreen({super.key, this.userId});
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final UserService _userService = UserService();
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Dashboard")),
      body: Column(
        children: [
          FutureBuilder<UserModel>(
            future: _userService.getUserData(widget.userId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

              final students = snapshot.data!;
              final  student = students;
              return ListTile(
                title: Text(student.firstName??""),
                subtitle: Text("state: ${student.email} | Age: ${student.birthDate}"),

                trailing: IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          senderId: _userService.getCurrentUserId(),
                          receiverId: student.userId??'',
                        ),
                      ),
                    );
                  },
                ),
              );

            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _userService.getUsersByRole("teacher"),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                List students = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    UserModel student = UserModel.fromFirestore(students[index]);
                    return ListTile(
                      title: Text(student.firstName??""),
                      subtitle: Text("email: ${student.email} | Age: ${student.birthDate}"),
                      trailing: IconButton(
                        icon: Icon(Icons.chat),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                senderId: _userService.getCurrentUserId(),
                                receiverId: student.userId??'',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TeacherScreen extends StatefulWidget {
  final userId;

  const TeacherScreen({super.key, this.userId});
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  final UserService _userService = UserService();
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teacher Dashboard")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _userService.getUsersByRole("student"),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                List students = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    UserModel student = UserModel.fromFirestore(students[index]);
                    return ListTile(
                      title: Text(student.firstName??""),
                      subtitle: Text("email: ${student.email} | Age: ${student.birthDate}"),
                      trailing: IconButton(
                        icon: Icon(Icons.chat),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                senderId: _userService.getCurrentUserId(),
                                receiverId: student.userId??'',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
