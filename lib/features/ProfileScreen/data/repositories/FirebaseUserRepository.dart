import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../1_login/data/user_model.dart';
import '../../domain/repositories/UserRepository.dart';

class FirebaseUserRepository implements UserRepository {
  final CollectionReference usersRef =
  FirebaseFirestore.instance.collection('users');

  @override
  Future<void> createUser(UserModel user) async {

    await usersRef.doc(user.userId.toString()).set(user.toJson());
  }

  @override
  Future<UserModel?> getUser(int userId) async {
    DocumentSnapshot doc = await usersRef.doc(userId.toString()).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await usersRef.doc(user.userId.toString()).update(user.toJson());
  }

  @override
  Future<void> deleteUser(int userId) async {
    await usersRef.doc(userId.toString()).delete();
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot snapshot = await usersRef.get();

    return snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> assignRole(int userId, String role) async {
    DocumentSnapshot doc = await usersRef.doc(userId.toString()).get();
    if (doc.exists) {
      List<String> roles = List<String>.from(doc['roles'] ?? []);
      if (!roles.contains(role)) {
        roles.add(role);
        await usersRef.doc(userId.toString()).update({'roles': roles});
      }
    }
  }

  @override
  Future<void> removeRole(int userId, String role) async {
    DocumentSnapshot doc = await usersRef.doc(userId.toString()).get();
    if (doc.exists) {
      List<String> roles = List<String>.from(doc['roles'] ?? []);
      if (roles.contains(role)) {
        roles.remove(role);
        await usersRef.doc(userId.toString()).update({'roles': roles});
      }
    }
  }

  @override
  Future<void> addUser(UserModel user) async {
    try {
      // Reference to the user's document
      final userRef = usersRef.doc(user.email);

      // Check if the user document exists
      final docSnapshot = await userRef.get();

      if (docSnapshot.exists) {
        // Update existing user document
        await userRef.update(user.toJson());
        print("User updated successfully: ${user.email}");
      } else {
        // Add a new user document
        await userRef.set(user.toJson());
        print("User added successfully: ${user.email}");
      }
    } catch (e) {
      print("Error adding/updating user: $e");
      // Optionally, handle the error (e.g., log or rethrow)
    }
  }

}
