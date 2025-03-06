import 'package:flutter/material.dart';
import 'package:hr360/features/main_screen/page/src/user_service.dart';
import '../../../1_login/data/service.dart';
import '../../../1_login/data/user_model.dart';
import 'AdminDashboard.dart';
import 'ProfileFormScreen.dart';
import 'StudentScreen.dart';




class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: _userService.getUserData(_authService.getCurrentUserId()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        UserModel user = snapshot.data!;

        if (user.status == "pending") {

          return Scaffold(body: Center(child: Text("🔄 Your account is inactive approval.")));

        } else if (user.status == "inactive") {
          return ProfileFormScreen(user: user);
        }

        if (user.role == "admin") return AdminDashboard();
        if (user.role == "teacher") return TeacherScreen(userId:user.userId);
        return StudentScreen(userId:user.userId);
      },
    );
  }
}


