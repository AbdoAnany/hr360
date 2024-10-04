// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:hr360/features/auth/presentation/manager/LoginControl.dart';
// import 'package:hr360/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:hr360/core/utils/http/dio_client.dart';
import 'package:hr360/core/utils/local_storage/storage_utility.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'firebase_options.dart';


final sl = GetIt.instance;

Future<void> initAppModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
bool isInit=  await GetStorage.init( 'MyStorage');
print(isInit);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TDioHelper.init();

  final firestore = FirebaseFirestore.instance;


  //sl.registerLazySingleton<ThemeProvider>(() =>   Provider.of<ThemeProvider>(Get.context, listen: false));

}
systemChrome() => SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.grey));


