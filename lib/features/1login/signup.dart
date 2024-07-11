import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/style.dart';
import '../home/presentation/widgets/Mainbar.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _pageController = PageController();

  final _userCredentialsControllers = {
    'username': TextEditingController(),
    'password': TextEditingController(),
    'ConfirmPassword': TextEditingController(),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing up...')),
      );
      // Perform actual signup logic here (e.g., API call)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signUpFormKey,
          child: Center(
            child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   // SizedBox(height: 20,),

                    MainBarHeader(),
                   SizedBox(height: 20,),
                    SizedBox(
                      height: 390,
                      child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildUserCredentialsForm(),
                          _buildPersonalInfoForm(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    _buildNavigationButton('Next', () {
                      if (_pageController.page == 0) {
                        // Validate user credentials form
                        // if (_validateUserCredentials()) {
                        //
                        // }
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    }),
                  ],
                ),
              ),
          ),
          ),
        ),

    );
  }

  bool _validateUserCredentials() {
    return _userCredentialsControllers['username']!.text.isNotEmpty &&
        _userCredentialsControllers['password']!.text.isNotEmpty &&
        _userCredentialsControllers['ConfirmPassword']!.text.isNotEmpty;
  }

  Widget _buildUserCredentialsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        _buildTextField(
          controller: _userCredentialsControllers['ConfirmPassword']!,
          label: 'Confirm Password',
          icon: Iconsax.lock,
          obscureText: true,
          validator: (value) =>
          value!.isEmpty ? 'Please enter a password' : null,
        ),
      ],
    );
  }

  Widget _buildPersonalInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [

          Expanded(
            child:         _buildTextField(
              controller: _personalInfoControllers['firstName']!,
              label: 'First Name',
              icon: Iconsax.user,
              validator: (value) =>
              value!.isEmpty ? 'Please enter your first name' : null,
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child:         _buildTextField(
              controller: _personalInfoControllers['lastName']!,
              label: 'Last Name',
              icon: Iconsax.profile_2user,
              validator: (value) =>
              value!.isEmpty ? 'Please enter your last name' : null,
            ),
          ),
        ],),



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
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDropdown(
              label: 'Gender',
              value: _selectedGender,
              items: const ['Male', 'Female', 'Other'],
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
      ],
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
      padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
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
          border: OutlineInputBorder(),
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

  Widget _buildNavigationButton(String label, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,color: AppColor.primary,
       height: 60,minWidth: 400,shape: RoundedRectangleBorder(borderRadius: AppStyle.borderRadius15),
      child: Text(label,style: TextStyle(color: AppColor.white),),
    );
  }
}
