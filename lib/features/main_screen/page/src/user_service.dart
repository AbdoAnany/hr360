import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr360/features/1_login/data/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔄 Update User Info
  Future<void> updateUserInfo(String userId, Map<String, dynamic> updates) async {
    await _firestore.collection('users').doc(userId).update(updates);
  }

  // ✅ Get User Data (Returns a Future)
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataRow(String userId) async {
    return await _firestore.collection('users').doc(userId).get();
  }

  Future<UserModel> getUserData(String userId) async {
  final date= await getUserDataRow(userId);
  return UserModel.fromFirestore(date);
  }



  // 🔥 Stream User Data (Real-time Updates)
  Stream<DocumentSnapshot> streamUserData(String userId) {
    return _firestore.collection('users').doc(userId).snapshots();
  }

  // ✅ Activate User (Admin Only)
  Future<void> activateUser(String userId) async {
    await _firestore.collection('users').doc(userId).update({"status": "active"});
  }

  // ❌ Deactivate User (For Admins to Control Access)
  Future<void> deactivateUser(String userId) async {
    await _firestore.collection('users').doc(userId).update({"status": "inactive"});
  }

  getUsersByRole(String s) {
    return _firestore.collection('users').where('role', isEqualTo: s).snapshots();
  }

  getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}
