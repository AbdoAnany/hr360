import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/presentation/widgets/custom_text_field.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/data/models/signup_form_model.dart';
import 'package:hr360/features/1_login/utils/form_validators.dart';
import 'package:iconsax/iconsax.dart';

class UserCredentialsForm extends StatefulWidget {
  final SignUpFormModel formModel;
  final Map<String, TextEditingController> controllers;
  // final bool isSmallScreen;

  const UserCredentialsForm({
    Key? key,
    required this.formModel,
    required this.controllers,
    // required this.isSmallScreen,
  }) : super(key: key);

  @override
  State<UserCredentialsForm> createState() => _UserCredentialsFormState();
}

class _UserCredentialsFormState extends State<UserCredentialsForm> {
  bool _passwordObscured = true;
  bool _confirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final formWidth = double.infinity ;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Please enter your credentials',
              style: TextStyle(
                fontSize: 14.spMin,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              controller: widget.controllers['username']!,
              label: 'Username',
              prefixIcon: Iconsax.security_user,
              errorText: widget.formModel.usernameError,
              maxLength: SignUpFormModel.maxUsernameLength,
              width: formWidth,
              validator: FormValidators.validateUsername,
            ),
            CustomTextField(
              controller: widget.controllers['password']!,
              label: 'Password',
              prefixIcon: Iconsax.lock,
              obscureText: _passwordObscured,
              width: formWidth,
              suffixIcon: IconButton(
                icon: Icon(_passwordObscured ? Iconsax.eye : Iconsax.eye_slash),
                onPressed: () => setState(() => _passwordObscured = !_passwordObscured),
              ),
              validator: FormValidators.validatePassword,
            ),
            CustomTextField(
              controller: widget.controllers['confirmPassword']!,
              label: 'Confirm Password',
              prefixIcon: Iconsax.lock,
              obscureText: _confirmPasswordObscured,
              width: formWidth,
              suffixIcon: IconButton(
                icon: Icon(_confirmPasswordObscured ? Iconsax.eye : Iconsax.eye_slash),
                onPressed: () => setState(() => _confirmPasswordObscured = !_confirmPasswordObscured),
              ),
              validator: (value) => FormValidators.validateConfirmPassword(
                value, widget.controllers['password']!.text,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: formWidth,
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password Requirements:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.spMin,
                      color: AppColor.primary,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '• At least 8 characters\n'
                    '• At least one number\n'
                    '• Avoid using personal information',
                    style: TextStyle(fontSize: 12.spMin),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
