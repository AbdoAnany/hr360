
import 'package:flutter/animation.dart';

class AnimationHelper{
  static  late  AnimationController animationController;
  static late  Animation<double> animationDouble;

 static fadeInOut(vsync){
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
      reverseDuration: const Duration(seconds: 1),
    );

    animationDouble = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeInOut,
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }
}