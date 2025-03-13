import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final bool isPrimary;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.isPrimary = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: 60.h,
      child: MaterialButton(
        onPressed: isLoading ? null : onPressed,
        color: isPrimary ? AppColor.primary : Colors.grey[300],
        disabledColor: isPrimary ? AppColor.primary.withOpacity(0.7) : Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                label,
                style: TextStyle(
                  color: isPrimary ? AppColor.white : Colors.black, 
                  fontSize: 16.spMin
                ),
              ),
      ),
    );
  }
}
