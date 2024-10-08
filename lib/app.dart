import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:hr360/core/utils/constants/text_strings.dart';
import 'package:hr360/core/utils/theme/theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';
import 'package:hr360/features/3_academics/domain/entities/course.dart';
import 'package:provider/provider.dart';

import 'di.dart';
import 'features/1_login/data/repositries/auth_repo_impl.dart';
import 'features/1_login/presentation/blocs/auth_cubit/auth_cubit.dart';

import 'features/3_academics/domain/usecases/get_courses.dart';
import 'features/3_academics/presentation/manager/course_bloc.dart';
import 'features/3_academics/presentation/state_management/course_provider.dart';
import 'features/4_user/presentation/manager/bloc/user_bloc.dart';
import 'features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'features/main_screen/DashboardScreen.dart';

class Get {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          BlocProvider(create: (context) => sl<AuthCubit>()),
          BlocProvider(create: (context) => sl<HomeCubit>()),
          // BlocProvider(create: (context) => sl<CourseBloc>()),
          // BlocProvider(create: (context) =>sl<UserBloc>()),
          // ChangeNotifierProvider(
          //   create: (_) => CourseProvider(sl<GetCourses>()),
          // ),
        ],
        child: Consumer<ThemeProvider>(builder: (context, them, c) {
          them.getThemeMode();
          TSizes.init(context: context);
          ScreenUtil.init(context);
          return ScreenUtilInit(
              designSize: Size(
                TSizes.uiSW,
                TSizes.uiSH,
              ),
              minTextAdapt: true,
              splitScreenMode: true,
              useInheritedMediaQuery: true,
              ensureScreenSize: true,
              child: MaterialApp(
                  builder: (context, w) {
                    TTextTheme.init(context, them);
                    return w!;
                  },
                  title: TTexts.appName,
                  themeMode: them.themeMode,
                  theme: TAppTheme.lightTheme,
                  darkTheme: TAppTheme.darkTheme,
                  debugShowCheckedModeBanner: false,
                  home:const DashboardScreen(),

              )
          );

        }));
  }
}
//sbp_0777c39fd3cec540cb5094f21bd1703e4d49012e
