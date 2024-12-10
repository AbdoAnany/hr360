import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_strings.dart';



/// A class to define text styles, button styles, and other reusable styles.
class AppStyle {
  // Text Styles
  static  TextStyle heading1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.darkGray,
  );

  static  TextStyle heading2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.darkGray,
  );

  static  TextStyle heading3 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.darkGray,
  );

  static  TextStyle bodyText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.darkGray,
  );

  static  TextStyle labelText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.placeholder,
  );

  static  TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  // Button Styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColor.primary,
    textStyle: buttonText,
    padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 4,
  );

  static final ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    side: const BorderSide(color: AppColor.primary),
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.primary,
    ),
    padding:  EdgeInsets.symmetric(vertical: 14.h, horizontal: 22.w),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Input Field Decoration
  static InputDecoration inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColor.placeholder),
      filled: true,
      fillColor: AppColor.lightGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.mediumGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primary),
      ),
    );

  }

  // Snackbar Styles
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      content: Text(message, style:  TextStyle(color: AppColor.white)),
      backgroundColor: AppColor.success,
      behavior: SnackBarBehavior.floating,
    );
  }

  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      content: Text(message, style:  TextStyle(color: AppColor.white)),
      backgroundColor: AppColor.error,
      behavior: SnackBarBehavior.floating,
    );
  }
  static TextStyle font18Black400 =  TextStyle(
    color: AppColor.textPrimary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16PrimaryBold =  TextStyle(
    color: AppColor.primary,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14Gray400 =  TextStyle(
    color: AppColor.textSecondary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font12Error =  TextStyle(
    color: AppColor.error,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  // static TextStyle font18Black400 = const TextStyle(
  //     color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w400);
  //
  // static TextStyle font14Gray400 = const TextStyle(
  //     color: AppColor.darkerGrey, fontSize: 14, fontWeight: FontWeight.w400);

  static BorderRadius borderRadius15 = BorderRadius.circular(25);

  static BoxDecoration coursesDecoration = BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(12));
  static BoxDecoration decorationPage =  const BoxDecoration(
      color: AppColor.bgLight,


      image:DecorationImage(image:  AssetImage(TImages.bgCircles)),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25)));


  static SnackBar warningSnackBar(String message) {
    return SnackBar(
      content: Text(message, style: const TextStyle(color: AppColor.white)),
      backgroundColor: AppColor.warning,
      behavior: SnackBarBehavior.floating,
    );
  }
}

class AppColor {
  // Primary Colors
  static const Color primary = Color(0xFF0052CC);
  static const Color lightBlue = Color(0xFF85C1E9);

  // // Secondary Colors
  // static const Color success = Color(0xFF27AE60);
  // static const Color warning = Color(0xFFF1C40F);
  // static const Color error = Color(0xFFE74C3C);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  // static const Color darkerGrey = Color(0xFF2C3E50);
  static const Color darkGray = Color(0xFF2C3E50);
  static const Color lightGray = Color(0xFFECF0F1);
  static const Color mediumGray = Color(0xFFBDC3C7);
  static const Color placeholder = Color(0xFF7F8C8D);
  // Background Colors
  static const Color scaffoldBackground = Color(0xFFF5F5F5);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color lightBackground = Color(0xFFF6F6F6);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // // Status Colors
  // static const Color success = Color(0xFF388E3C);
  // static const Color warning = Color(0xFFF57C00);
  // static const Color error = Color(0xFFD32F2F);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  // static const Color white = Color(0xFFFFFFFF);
  static const Color blueWhite = Color(0xffEEF1F6);
  static const Color ofWhite = Color(0xfff3f3f3);
  static const Color transparent = Colors.transparent;
  static const bgLight = Color(0xFFF4F4F4);
  static const bgSecondayLight = Color(0xFFFCFCFC);
  static const titleLight = Color(0xFF272B30);
  static const textLight = Color(0xFF6F767E);
  static const textGrey = Color(0xFF9A9FA5);
  static const iconLight = Color(0xFF272B30);
  static const iconBlack = Color(0xFF1A1D1F);
  static const iconGrey = Color(0xFF9A9FA5);
  static const highlightLight = Color(0xFFEFEFEF);

  // static const primary = Color(0xFF2A85FF);
  static const primaryPurple = Color(0xFF8E59FF);
  // static const success = Color(0xFF83BF6E);
  // static const error = Color(0xFFFF6A55);

  static const secondaryMistyrose = Color(0xFFFFE7E4);
  static const secondaryPeach = Color(0xFFFFBC99);
  static const secondaryLavender = Color(0xFFCABDFF);
  static const secondaryBabyBlue = Color(0xFFB1E5FC);
  static const secondaryMintGreen = Color(0xFFB5E4CA);
  static const secondaryPaleYellow = Color(0xFFFFD88D);

  static const  List<Color> colorList = [
    AppColor.primary,
    AppColor.primaryPurple,
    AppColor.titleLight,
    AppColor.secondaryLavender,
    AppColor.secondaryBabyBlue,
    AppColor.secondaryMintGreen,
    AppColor.secondaryPaleYellow,
    AppColor.success,
    AppColor.info,
    AppColor.iconGrey,
    AppColor.blueWhite,
    AppColor.blueWhite,
    AppColor.blueWhite,
    AppColor.blueWhite,
    AppColor.blueWhite,
  ];

  static BoxDecoration inputFieldDecoration = BoxDecoration(
    color: AppColor.lightBackground,
    border: Border.all(color: AppColor.grey),
    borderRadius: BorderRadius.circular(12),
  );
}

class AppDecoration {
  static BorderRadius borderRadius15 = BorderRadius.circular(15);

  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColor.white,
    border: Border.all(color: AppColor.grey),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColor.grey.withOpacity(0.2),
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );

  static BoxDecoration pageDecoration = BoxDecoration(
    color: AppColor.primaryBackground,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );

  static BoxDecoration buttonPrimary = BoxDecoration(
    color: AppColor.primary,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration inputFieldDecoration = BoxDecoration(
    color: AppColor.lightBackground,
    border: Border.all(color: AppColor.grey),
    borderRadius: BorderRadius.circular(12),
  );
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        //height: 48,

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: AppDecoration.buttonPrimary,
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyle.buttonText.copyWith(color: AppColor.textWhite),
        ),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.cardDecoration,
      child: child,
    );
  }
}
class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final  String? Function(String?)? validator;
   const CustomInputField({required this.hintText, Key? key, this.controller,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.inputFieldDecoration,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyle.labelText,
          border: InputBorder.none,

          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
