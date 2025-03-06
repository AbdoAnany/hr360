import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import 'package:shared_preferences/shared_preferences.dart'; // For local storage
import 'HomeScreen.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen2> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _role = "student"; // Default role
  bool _rememberMe = false; // "Remember Me" checkbox state

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials(); // Load saved credentials when the screen initializes
  }

  // Load saved credentials from local storage
  void _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  // Save credentials to local storage
  void _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.remove('rememberMe');
    }
  }

  // Clear saved credentials (e.g., on logout)


  // Handle login with Firebase Auth
  void _handleLogin(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        _saveCredentials(); // Save credentials if "Remember Me" is checked
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: ${e.message}")),
      );
    }
  }

  // Handle signup with Firebase Auth
  void _handleSignup(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        // Save additional user role in Firestore or Realtime Database (optional)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup Successful! Please login.")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Failed: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login / Signup")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            // Radio Buttons for Role Selection
            Row(
              children: [
                SizedBox(width: 200,
                  child: RadioListTile<String>(
                    title: Text("Student"),
                    value: "student",
                    groupValue: _role,
                    onChanged: (value) => setState(() => _role = value!),
                  ),
                ),
                SizedBox(width: 200,
                  child: RadioListTile<String>(
                    title: Text("Teacher"),
                    value: "teacher",
                    groupValue: _role,
                    onChanged: (value) => setState(() => _role = value!),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) => setState(() => _rememberMe = value!),
                ),
                Text("Remember Me"),
              ],
            ),
            ElevatedButton(onPressed: () => _handleLogin(context), child: Text("Login")),
            ElevatedButton(onPressed: () => _handleSignup(context), child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}