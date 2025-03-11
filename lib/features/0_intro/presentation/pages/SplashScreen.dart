import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/animation/Animation.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/constants/keys.dart';
import '../../../../core/utils/local_storage/storage_utility.dart';
import '../../../../di.dart';
import '../../../1_login/data/user_model.dart';
import '../../../main_screen.dart';
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
        () {
      final UserModel? user=    THelperFunctions.getProfile();
       if(user !=null){
          AppRouter().navigateAndReplaceScreen(context, AppRoutes.dashboard);
        }else{
         context.go('/login', extra: {'clearHistory': true});
        }}
       );
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
        // color: AppColor.lightContainer,
        child: Center(
          child: Hero(
            tag: "AppImg.logoImg",
            child: FadeTransition(
              opacity: AnimationHelper.animationDouble,
              child: FlutterLogo(size: TSizes.productImageSize),
            ),
          ),
        ),
      ),
    );
  }
}
