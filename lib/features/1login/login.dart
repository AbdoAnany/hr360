import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
      //    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      // width: MediaQuery.of(context).size.width < 600
      //     ? MediaQuery.of(context).size.width * 0.9
      //     : 600,
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

           SizedBox(height: 20.0),
              MaterialButton(
                  color: AppColor.primary,
                  height: 54,
                  minWidth: 350.w,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColor.white),
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    )
    );
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
      width: MediaQuery.of(context).size.width < width!.w
          ? MediaQuery.of(context).size.width * 0.8
          : width.w,
      padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    double? width = 350,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width < width!
          ? MediaQuery.of(context).size.width * 0.9
          : width,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(Icons.arrow_drop_down),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Select $label' : null,
      ),
    );
  }
}
