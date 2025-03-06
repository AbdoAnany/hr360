import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // 🔥 Sign Up User (Student or Teacher)
  // Future<String?> signUp(String email, String password, String role) async {
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     String uid = userCredential.user!.uid;
  //
  //     // Save user details in Firestore
  //     await _firestore.collection('users').doc(uid).set({
  //       'email': email,
  //       'role': role,
  //       'createdAt': FieldValue.serverTimestamp(),
  //     });
  //
  //     return null; // Success
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
getCurrentUser() {
  return _auth.currentUser;
}
String getCurrentUserId() {
    return _auth.currentUser?.uid ?? '';
  }
  // 🔐 Login User
  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;

      // Fetch role & store locally
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      String role = userDoc['role'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userRole', role);

      return role; // Return role for redirection
    } catch (e) {
      print('>>>>>>>>> error '+e.toString());
      return e.toString();
    }
  }
// 🔥 Sign Up User (Default Status: Pending)
  Future<String?> signUp(String email, String password, String role) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'role': role,
        'status': 'pending', // New users are pending
        'name': '',
        'phone': '',
        'address': '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null; // Success
    } catch (e) {
      return e.toString();
    }
  }

  // 🔄 Get Current User Info
  Future<UserModel?> getUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore.collection('users').doc(uid).get();
    if (!userDoc.exists) return null;
    return UserModel.fromFirestore( userDoc);
  }
  // 🔄 Logout User
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userRole');
     _clearCredentials();
    await _auth.signOut();
  }
  void _clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('rememberMe');
  }
  // 🚀 Get Current User Role
  Future<String?> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userRole');
  }
}
