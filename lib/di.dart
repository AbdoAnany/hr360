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

import 'features/3_academics/data/repositories/course_repository_impl.dart';
import 'features/3_academics/domain/usecases/get_courses.dart';
import 'features/3_academics/presentation/manager/course_bloc.dart';
import 'features/4_user/data/repositories/FirebaseUserRepository.dart';
import 'features/4_user/presentation/manager/bloc/user_bloc.dart';
import 'firebase_options.dart';
// import 'features/auth/data/remote/data_sources/users_remote_data_source.dart';
// import 'features/auth/data/repositories/repo_impl.dart';
// import 'features/auth/domain/use_cases/login_use_case.dart';
// import 'features/auth/domain/use_cases/logout_use_case.dart';
// import 'features/auth/domain/use_cases/register_use_case.dart';
// import 'features/auth/helper/AppRoutes.dart';
// import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
// import 'features/auth/presentation/manager/register_bloc/register_bloc.dart';
// import 'firebase_options.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
bool isInit=  await GetStorage.init( 'MyStorage');
print(isInit);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TDioHelper.init();
  TLocalStorage localStorage=TLocalStorage();
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<TLocalStorage>(() =>localStorage);
  getIt.registerLazySingleton<TTextTheme>(() => TTextTheme());
 await authSetup();
  final firestore = FirebaseFirestore.instance;
  final courseRepository = CourseRepositoryImpl(firestore);
  final getCourses = GetCourses(courseRepository);

  getIt.registerLazySingleton<GetCourses>(() => getCourses);
  getIt.registerLazySingleton<FirebaseUserRepository>(() => FirebaseUserRepository( ));


  getIt.registerFactory<CourseBloc>(() => CourseBloc( getIt()));

  getIt.registerFactory<UserBloc>(() => UserBloc( getIt()));
  // sl.registerLazySingleton<CourseProvider>(() => CourseProvider( sl()));

  //sl.registerLazySingleton<ThemeProvider>(() =>   Provider.of<ThemeProvider>(Get.context, listen: false));

}
systemChrome() => SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.grey));


authSetup(){
  // sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  // final firebaseAuth = sl.get<FirebaseAuth>();
  // sl.registerSingleton<AppRoutes>(AppRoutes(firebaseAuth));

  // sl.registerSingleton<AuthRepoImpl>(AuthRepoImpl(UsersRemoteDataSource(sl.get<FirebaseAuth>()), sl.get<FirebaseAuth>()),);




  // sl.registerFactory<HomeBloc>(() => HomeBloc(
  // //  LogoutUseCase(sl.get<AuthRepoImpl>()),
  // ));
  // sl.registerFactory<LoginCubit>(() => LoginCubit());
  // sl.registerFactory<LoginControl>(() => LoginControl());
  // // sl.registerFactory<LoginBloc>(() => LoginBloc(LoginUseCase(sl.get<AuthRepoImpl>(),)));

  // sl.registerFactory<RegisterBloc>(() => RegisterBloc(RegisterUseCase(sl.get<AuthRepoImpl>(),)));

}
