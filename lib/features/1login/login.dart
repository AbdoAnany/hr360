import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr360/features/1login/signup.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
      // Perform signup logic
    }
  }
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadRememberMe();
  }

  Future<void> _loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = (prefs.getBool('rememberMe') ?? false);
    });
    if (rememberMe) {
      // Implement auto-login logic here
      // e.g., navigate to the home screen
    }
  }
  void _navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
  Future<void> _setRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextField(
                controller: _usernameController,
                label: 'Username',
                icon: Iconsax.security_user,
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
              ),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                icon: Iconsax.lock,
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
              ),
              SizedBox(height: 10.0),
              SizedBox(width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Remember Me',
                      // style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              MaterialButton(
                  color: AppColor.primary,
                  height: 56,
                  minWidth: 350,
                  shape: RoundedRectangleBorder(
                   borderRadius:   AppStyle.borderRadius15),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: AppColor.white),
                  ),
                  onPressed: () {}),
              SizedBox(height: 20),
              InkWell(
                onTap: _navigateToSignUp,
                child: RichText(
                  text: const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: AppColor.textPrimary, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'create new account',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16,
                        //  fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    double? width = 350,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
              borderRadius:  AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
          focusedBorder:  OutlineInputBorder(
              borderRadius: AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
          border: OutlineInputBorder(
              borderRadius:  AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
        ),
        validator: validator,
      ),
    );
  }



}
