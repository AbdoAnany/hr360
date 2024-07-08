import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  String? _selectedGender;
  String? _selectedRole;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
      // Perform signup logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Center(
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
              // Material(
              //   child: Text(
              //     'Sign Up',
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.lato(
              //       textStyle: TextStyle(
              //         fontSize: 32.0.w,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20.0.h),
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
              SizedBox(  width: 350.w,child: Divider()),
              SizedBox(
                width: 350.w,
                child: Row(
                  children: [
                    _buildTextField(
                      controller: _firstNameController,
                      label: 'First Name',
                      width: 170,
                      icon: Iconsax.user,
                      validator: (value) =>
                      value!.isEmpty ? 'Enter first name' : null,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    _buildTextField(
                      controller: _lastNameController,
                      label: 'Last Name',
                      width: 170,
                      icon: Iconsax.profile_2user,
                      validator: (value) =>
                      value!.isEmpty ? 'Enter last name' : null,
                    ),
                  ],
                ),
              ),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                icon: Iconsax.sms,
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                icon: Iconsax.call,
              ),
              _buildTextField(
                controller: _addressController,
                label: 'Address',
                icon: Iconsax.home,
              ),
              _buildTextField(
                controller: _nationalIdController,
                label: 'National ID',
                icon: Iconsax.user_tick,
              ),
              SizedBox(
                width: 350.w,
                child: Row(
                  children: [
                    _buildDropdown(
                      label: 'Gender',
                      width: 170.w,
                      value: _selectedGender,
                      items: ['Male', 'Female'],
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    _buildDropdown(
                      label: 'Role',
                      width: 170.w,
                      value: _selectedRole,
                      items: [
                        'Student',
                        'Teacher',
                        'Employee',
                        'Admin',
                        'Not Active'
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                  color: AppColor.primary,
                  height: 54,
                  minWidth: 350.w,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColor.white),
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    ),);
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
