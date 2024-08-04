import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/home/presentation/pages/Home.dart';
import 'package:hr360/features/1login/login.dart';
import 'package:provider/provider.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:hr360/core/utils/constants/text_strings.dart';
import 'package:hr360/core/utils/theme/theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';

import 'di.dart';
import 'features/0-intro/presentation/intro_screen.dart';
import 'features/1login/blocs/auth_cubit/auth_cubit.dart';
import 'features/1login/data/repositries/auth_repo_impl.dart';
import 'features/1login/domain/repositires/auth_repo.dart';
import 'features/1login/signup.dart';
import 'features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'features/main_screen/DashboardScreen.dart';
import 'main.dart';

class Get {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;
  static GlobalKey<ScaffoldState> get scaffoldHomeState =>
      GlobalKey<ScaffoldState>();
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          BlocProvider(create: (context) => AuthCubit(AuthRepoImpl())),
          BlocProvider(create: (context) => HomeCubit()),
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
                  navigatorKey: Get.navigatorKey,
                  title: TTexts.appName,
                  themeMode: them.themeMode,
                  theme: TAppTheme.lightTheme,
                  darkTheme: TAppTheme.darkTheme,
                  debugShowCheckedModeBanner: false,
                  home:DashboardScreen(),

                //  const Home()
              )
          );
          // builder: (ctx, child) {
          //
          //   ScreenUtil.init(ctx);
          //
          //   return child!;
          // });
        }));
  }
}
//sbp_0777c39fd3cec540cb5094f21bd1703e4d49012e
