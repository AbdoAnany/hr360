import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:hr360/core/utils/constants/text_strings.dart';
import 'package:hr360/core/utils/theme/theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';
import 'package:provider/provider.dart';

import 'di.dart';
import 'features/1_login/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'features/main_screen/main_screen.dart';

/// A utility class for accessing navigator context and state globally.
class Get {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;
}

/// The main application widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          // Initialize theme and sizes.
          themeProvider.getThemeMode();
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
              builder: (context, widget) {
                // Initialize text themes.
                TTextTheme.init(context, themeProvider);
                return widget!;
              },
              title: TTexts.appName,
              themeMode: themeProvider.themeMode,
              theme: TAppTheme.lightTheme,
              darkTheme: TAppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.navigatorKey,
              home: const MainScreen(),
            ),
          );
        },
      ),
    );
  }
}
