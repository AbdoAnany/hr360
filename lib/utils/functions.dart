// import 'package:flash/flash.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../features/1login/data/user_model.dart';
// import 'constants.dart';
//
//
// class HelperFunctions {
//   static String? formatTime(int milliseconds) {
//     var secs = milliseconds ~/ 1000;
//     var minutes = ((secs % 3600) ~/ 60).toString?().padLeft(2, '0');
//     var seconds = (secs % 60).toString?().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
//
//   static Future<T> errorBar<T>(
//     BuildContext context, {
//     String? title,
//     required String? message,
//     Duration duration = const Duration(seconds: 4),
//   }) {
//     return showFlash<T>(
//       context: context,
//       duration: duration,
//       builder: (context, controller) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Flash(
//             controller: controller,
//             horizontalDismissDirection: HorizontalDismissDirection.horizontal,
//             backgroundColor: Colors.black87,
//             child: FlashBar(
//               title: title == null
//                   ? null
//                   : Text('تسجيل الدخول',
//                       style: _titleStyle(context, Colors.white)),
//               message:
//                   Text(message, style: _contentStyle(context, Colors.white)),
//               icon: Icon(Icons.warning, color: Colors.red[300]),
//               leftBarIndicatorColor: Colors.red[300],
//             ),
//           ),
//         );
//       },
//     );
//   }
//   static Future<T> successBar<T>(
//     BuildContext context, {
//     String? title,
//     required String? message,
//     Duration duration = const Duration(seconds: 2),
//   }) {
//     return showFlash<T>(
//       context: context,
//       duration: duration,
//       builder: (context, controller) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Flash(
//             controller: controller,
//             horizontalDismissDirection: HorizontalDismissDirection.horizontal,
//             backgroundColor: Colors.black87,
//             child: FlashBar(
//               title: title == null
//                   ? null
//                   : Text('تسجيل الدخول',
//                       style: _titleStyle(context, Colors.white)),
//               message:
//                   Text(message, style: _contentStyle(context, Colors.white)),
//               icon: Icon(Icons.check, color: Colors.green[300]),
//               leftBarIndicatorColor: Colors.green[300],
//             ),
//           ),
//         );
//       },
//     );
//   }
//   static Future saveUser(data) async {
//     await GetStorage().write(kIsLoggedIn, true);
//     await GetStorage().write(kUser, data);
//   }
//     static Future saveProfile(data) async {
//     await GetStorage().write(kProfile, data);
//   }
//   static Future saveToken(data) async {
//     await GetStorage().write(kToken, data);
//   }
//   static UserModel getUser() {
//     print('  GetStorage().read(kUser)${GetStorage().read(kUser)}');
//     return UserModel.fromJson(
//       GetStorage().read(kUser),
//     );
//   }
//     static ProfileModel getProfile() {
//     print('  GetStorage().read(kProfile)${GetStorage().read(kProfile)}');
//     return ProfileModel.fromJson(
//       GetStorage().read(kProfile),
//     );
//   }
//   static String? getToken() {
//     print('  Token${GetStorage().read(kToken)}');
//     return GetStorage().read(kToken);
//   }
//   static Map<String?, dynamic> removeEmptyFildesFromMap(
//       Map<String?, dynamic> map) {
//     return map
//       ..removeWhere((dynamic key, dynamic value) =>
//           key == null || value == null || value == "");
//   }
// }
// TextStyle _titleStyle(BuildContext context, [Color color]) {
//   var theme = Theme.of(context);
//   return (theme.dialogTheme?.titleTextStyle ?? theme.textTheme.headline6)
//       .copyWith(color: color);
// }
// TextStyle _contentStyle(BuildContext context, [Color? color]) {
//   var theme = Theme.of(context);
//   return (theme.dialogTheme?.contentTextStyle ?? theme.textTheme.bodyText2)
//       .copyWith(color: color);
// }
