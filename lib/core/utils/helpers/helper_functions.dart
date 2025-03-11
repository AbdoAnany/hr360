import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hr360/core/routing/app_router.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:intl/intl.dart';

import '../../../app.dart';
import '../../../di.dart';
import '../constants/keys.dart';
import '../local_storage/storage_utility.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class THelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(  screen,{BuildContext? context}) {
    // Navigator.push(
    //   context??   Get.context,
    //   MaterialPageRoute(builder: (_) => screen,),
    // );
    navigatorKey.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal, // Choose horizontal, vertical, or scaled
            child: child,
          );
        },
        reverseTransitionDuration:  const Duration(milliseconds: 400),
        transitionDuration: const Duration(milliseconds: 400), // Animation duration
      ),
    );

  }


  static void goTO( String screenRouter) {
   //  print('goTO $screenRouter');
   // router.go('/$screenRouter');
  }  static void goAndReplaceScreen(   AppRoutes route, {   Map<String, String>? params, }) {
    final AppRouter router = AppRouter();

    router.navigateAndReplaceScreen(Get.context, route);
  }
  // static void navigateAndReplaceScreen( Widget screen) {
  //   final AppRouter _router = AppRouter();
  //
  //   _router.navigateAndReplaceScreen(Get.context, AppRoutes.academics);
  //   // Navigator.pushReplacement(
  //   //   Get.context,
  //   //   MaterialPageRoute(builder: (_) => screen),
  //   // );
  // }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static UserModel? getProfile() {
    final date = getIt<TLocalStorage>().readData(AppKeys.userDataLogin);
    if(date==null){
      return null;
    }
    final UserModel profile = UserModel.fromJson(date);
    return profile;
  }
}
