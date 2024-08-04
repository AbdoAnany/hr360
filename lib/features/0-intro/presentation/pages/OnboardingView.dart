import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../di.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/theme/widget_themes/text_theme.dart';
import '../../../home/presentation/pages/Home.dart';
import '../intro_screen.dart';
import '../widget/OnBoardingItems.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = OnBoardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        //    color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Skip Button
                  TextButton(
                      onPressed: () => pageController
                          .jumpToPage(controller.items.length - 1),
                      child: const Text("Skip")),

                  //Indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn),
                    effect: WormEffect(
                      dotHeight: TSizes.iconXs,
                      dotWidth: TSizes.iconXs,
                      activeDotColor: AppColor.primary,
                    ),
                  ),

                  //Next Button
                  TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      child: const Text("Next")),
                ],
              ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: TSizes.md16,
        ),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Image.asset(controller.items[index].image),
                  SizedBox(height: 15.h),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h),
                  Text(controller.items[index].descriptions,
                      style: const TextStyle(color: Colors.grey, fontSize: 17),
                      textAlign: TextAlign.center),
                ],
              );
            }),
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.primary),
      width: MediaQuery.of(context).size.width * .9,
      height: TSizes.buttonHeight,
      child: TextButton(
          onPressed: () async {
            sl<SharedPreferences>().setBool(IntroScreen.onBoarding, false);

            if (!mounted) return;
            THelperFunctions.navigateAndReplaceScreen(Home());
            //   THelperFunctions.navigateAndReplaceScreen( LoginPage());
          },
          child:
              Text("Get started", style: TTextTheme.darkTextTheme.headlineSmall
                  //    TextStyle(color: Colors.white),
                  )),
    );
  }
}
