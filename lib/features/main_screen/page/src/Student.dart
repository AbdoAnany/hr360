import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final int age;
  final String grade;
  final DateTime updatedAt;

  Student({required this.id, required this.name, required this.age, required this.grade, required this.updatedAt});

  factory Student.fromFirestore(Map<String, dynamic> data, String id) {
    return Student(
      id: id,
      name: data['name'],
      age: data['age'],
      grade: data['grade'],
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
}

class Teacher {
  final String id;
  final String name;
  final String subject;
  final DateTime updatedAt;

  Teacher({required this.id, required this.name, required this.subject, required this.updatedAt});

  factory Teacher.fromFirestore(Map<String, dynamic> data, String id) {
    return Teacher(
      id: id,
      name: data['name'],
      subject: data['subject'],
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
}
class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;

  Message({required this.id, required this.senderId, required this.receiverId, required this.text, required this.timestamp});

  factory Message.fromFirestore(Map<String, dynamic> data, String id) {
    return Message(
      id: id,
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      text: data['text'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "text": text,
      "timestamp": FieldValue.serverTimestamp(),
    };
  }
}
