import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr360/features/1_login/data/user_model.dart';

class AdminDashboard extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _activateUser(UserModel user)async {

    await _firestore.collection('users').doc(user.userId).update({"status":
    user.status == 'active'? 'inactive':'active'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: StreamBuilder<List<UserModel>>(
        stream: _getUsersByRole(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          var users = snapshot.data;

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              UserModel? user = users?[index];
              return ListTile(
                title: Text(user?.email??''),
                subtitle: Text("Role: ${user?.role??''}"),
                trailing: ElevatedButton(
                  onPressed: () => _activateUser(user!),
                  child: Text(user?.status == 'active' ? 'Deactivate' : 'Activate'),
                ),
              );
            },
          );
        },
      ),
    );
  }
  _getUsersByRole() {
  final snapshot  =_firestore.collection('users')
    // .where('status', isEqualTo: 'pending')
        .snapshots().map(_userListFromSnapshot);
    return snapshot;
  }
  _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
        userId: doc['userId'] ?? '',
        email: doc['email'] ?? '',
        role: doc['role'] ?? '',
        status: doc['status'] ?? '',
      );
    }).toList();
  }

}

