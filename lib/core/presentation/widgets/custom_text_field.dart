import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final String? errorText;
  final TextInputType? keyboardType;
  final int maxLines;
  final double? width;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLength,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      constraints: const BoxConstraints(
        maxWidth: 400,
        minWidth: 200,
      ),

      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
