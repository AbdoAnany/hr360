import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr360/features/0-intro/presentation/pages/OnboardingView.dart';
import 'package:hr360/features/0-intro/presentation/pages/SplashScreen.dart';
import '../../../../di.dart';
class IntroScreen extends StatefulWidget {
  static const String onBoarding = 'onBoarding';
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {
  bool onBoardingShow = true;
  @override
  void initState() {
    onBoardingShow = sl<SharedPreferences>().getBool(IntroScreen.onBoarding) ?? true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoardingShow ? const OnBoardingView() : const SplashScreen(),
    );
  }
}
