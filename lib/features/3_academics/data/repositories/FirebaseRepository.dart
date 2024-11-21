import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/pages/PrimarySchoolClassesPage.dart';
import '../model/class.dart';

class FirebaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream to get all classes
  Stream<List<ClassRoomModel>> getAllClasses() {

    return _firestore.collection('classes').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => ClassRoomModel.fromJson2(doc.data(), doc.id))
            .toList());
  }
  Future<List<ClassRoomModel>> getAllClassRooms() async {

    QuerySnapshot snapshot = await  _firestore.collection('classes').get();
    return snapshot.docs
        .map((doc) => ClassRoomModel.fromJson2(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  // Add a new class
  Future<void> addClass(ClassRoomModel classRoom) async {
    print(classRoom.toJson());
    await _firestore.collection('classes')  .doc(classRoom.id).set(classRoom.toJson());
  }

  // Update an existing class
  Future<void> updateClass(
      String documentId, ClassRoomModel updatedClass) async {
    await _firestore
        .collection('classes')
        .doc(updatedClass.id)
        .update(updatedClass.toJson());
  }

  // Delete a class
  Future<void> deleteClass(String documentId) async {
    await _firestore.collection('classes').doc(documentId).delete();
  }

  // Add a subject to a class
  Future<void> addSubjectToClass(
      String classDocumentId, SubjectModel subject) async {
    await _firestore.collection('classes').doc(classDocumentId).update({
      'subjects': FieldValue.arrayUnion([subject.toJson()])
    });
  }

  // Update a specific subject in a class
  Future<void> updateSubjectInClass(String classDocumentId, String subjectName,
      SubjectModel updatedSubject) async {
    DocumentReference classRef =
        _firestore.collection('classes').doc(classDocumentId);

    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(classRef);

      if (!snapshot.exists) {
        throw Exception("Class does not exist!");
      }

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> subjects = data['subjects'] ?? [];

      // Find and replace the subject
      subjects = subjects.map((subject) {
        return subject['name'] == subjectName
            ? updatedSubject.toJson()
            : subject;
      }).toList();

      transaction.update(classRef, {'subjects': subjects});
    });
  }
}



class FireStoreSubjectsService {
  final CollectionReference _subjectsRef =
  FirebaseFirestore.instance.collection('subjects');

  Future<void> addSubject(SubjectModel subject) async {
    await _subjectsRef.add(subject.toJson());
  }

  Future<List<SubjectModel>> getSubjects() async {
    QuerySnapshot snapshot = await _subjectsRef.get();
    return snapshot.docs
        .map((doc) => SubjectModel.fromJson2(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> updateSubject(String id, Map<String, dynamic> data) async {
    await _subjectsRef.doc(id).update(data);
  }

  Future<void> deleteSubject(String id) async {
    await _subjectsRef.doc(id).delete();
  }
}
