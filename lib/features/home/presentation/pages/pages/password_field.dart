import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/theme/style.dart';


class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(TSizes. borderRadiusLg),
      ),
      child: TextFormField(
        obscureText: _obscureText, // Toggle the visibility of the password
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).iconTheme.color,
          ),
          hintText: "Enter your password",
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          // You can add more password validation rules if needed
          return null;
        },
      ),
    );
  }
}
