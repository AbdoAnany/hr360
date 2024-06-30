

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';



class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

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
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        // width: MediaQuery.of(context).size.width < 600
        //     ? MediaQuery.of(context).size.width * 0.9
        //     : 600,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                _buildTextField(
                  controller: _usernameController,
                  label: 'Username',
                  icon: Iconsax.security_user,
                  validator: (value) => value!.isEmpty ? 'Enter username' : null,
                ),
                _buildTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                     icon: Iconsax.user,
                  validator: (value) => value!.isEmpty ? 'Enter first name' : null,
                ),
                _buildTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                    icon: Iconsax.profile_2user,
                  validator: (value) => value!.isEmpty ? 'Enter last name' : null,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                    icon: Iconsax.sms,
                  validator: (value) => value!.isEmpty ? 'Enter email' : null,
                ),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Iconsax.lock,
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Enter password' : null,
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
                _buildDropdown(
                  label: 'Gender',
                  value: _selectedGender,
                  items: ['Male', 'Female'],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                _buildDropdown(
                  label: 'Role',
                  value: _selectedRole,
                  items: ['Student', 'Teacher', 'Employee', 'Admin', 'Not Active'],
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      );
    
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
        width: MediaQuery.of(context).size.width < 400
            ? MediaQuery.of(context).size.width * 0.9
            : 400,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          borderSide:BorderSide(color: Colors.black.withOpacity(.2))
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
        width: MediaQuery.of(context).size.width < 400
            ? MediaQuery.of(context).size.width * 0.9
            : 400,
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
