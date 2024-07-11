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
  // Use a more descriptive key name
  final _signUpFormKey = GlobalKey<FormState>();

  // Group controllers for better organization
  final _userCredentialsControllers = {
    'username': TextEditingController(),
    'password': TextEditingController(),
  };
  final _personalInfoControllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'nationalId': TextEditingController(),
  };

  String? _selectedGender;
  String? _selectedRole;

  void _signUp() {
    if (_signUpFormKey.currentState!.validate()) {
      // Show a more informative SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing up...')),
      );
      // Perform actual signup logic here (e.g., API call)
      // Access form values using _userCredentialsControllers['username']!.text, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'), // Add an AppBar for better UX
      ),
      body: Center(
        child: SingleChildScrollView(

          child: Form(
            key: _signUpFormKey,
            child:  SizedBox(    width: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // Consider adding a logo or welcome message here

                    // User Credentials Section
                    _buildTextField(
                      controller: _userCredentialsControllers['username']!,
                      label: 'Username',
                      icon: Iconsax.security_user,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a username' : null,
                    ),
                    _buildTextField(
                      controller: _userCredentialsControllers['password']!,
                      label: 'Password',
                      icon: Iconsax.lock,
                      obscureText: true,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter a password' : null,
                    ),
                     SizedBox(height: 20.h),

                    // Personal Information Section
                    Text(
                      'Personal Information',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     SizedBox(height: 10.h),
                    _buildTextField(
                      controller: _personalInfoControllers['firstName']!,
                      label: 'First Name',
                      icon: Iconsax.user,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter your first name' : null,
                    ),
                    _buildTextField(
                      controller: _personalInfoControllers['lastName']!,
                      label: 'Last Name',
                      icon: Iconsax.profile_2user,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter your last name' : null,
                    ),
                    _buildTextField(
                      controller: _personalInfoControllers['email']!,
                      label: 'Email',
                      icon: Iconsax.sms,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null,
                    ),
                    _buildTextField(
                      controller: _personalInfoControllers['phone']!,
                      label: 'Phone Number',
                      icon: Iconsax.call,
                      // Consider adding input formatters for phone numbers
                    ),
                    _buildTextField(
                      controller: _personalInfoControllers['address']!,
                      label: 'Address',
                      icon: Iconsax.home,
                    ),
                    _buildTextField(
                      controller: _personalInfoControllers['nationalId']!,
                      label: 'National ID',
                      icon: Iconsax.user_tick,
                    ),
                 SizedBox(height:20.h),
                    // Gender and Role Section
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround, // Better spacing
                       children: [
                         _buildDropdown(
                           label: 'Gender',
                           value: _selectedGender,
                           items: const ['Male', 'Female', 'Other'], // Add 'Other' for inclusivity
                           onChanged: (value) {
                             setState(() {
                               _selectedGender = value;
                             });
                           },
                         ),
                         _buildDropdown(
                           label: 'Role',
                           value: _selectedRole,
                           items: const [
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
                     SizedBox(height: 30.h),

                    // Sign Up Button
                    MaterialButton(height: 56.h,
color:AppColor.primary ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onPressed: _signUp, // Call the signup function
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: AppColor.white),
                      ),
                    ),
                     SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }

// ... (rest of the _buildTextField and _buildDropdown methods)

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    double? width = 350,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      // width: MediaQuery.of(context).size.width < width!.w
      //     ? MediaQuery.of(context).size.width * 0.8
      //     : width.w,
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
    double? width = 170,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
       //   prefixIcon: Icon(Icons.arrow_drop_down),
          border: OutlineInputBorder(
       //     borderRadius: BorderRadius.circular(8.0),
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
