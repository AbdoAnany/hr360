import 'package:flutter/material.dart';

import '../../../../../di.dart';
import '../../../../../utils/animation/Animation.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../home/home.dart';
// import '../../../../auth/helper/AppRoutes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    AnimationHelper.fadeInOut(this);


    Future.delayed(const Duration(seconds: 3),
            ()=>THelperFunctions.navigateAndReplaceScreen(
             Home()
               
               ));
  }

  @override
  void dispose() {
    AnimationHelper.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.lightContainer,
        child: Center(
          child: Hero(
            tag: "AppImg.logoImg",
            child: FadeTransition(
              opacity: AnimationHelper.animationDouble,
              child:  FlutterLogo(size: TSizes.productImageSize),
            ),
          ),
        ),
      ),
    );
  }
}
