import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:hr360/core/utils/constants/text_strings.dart';
import 'package:hr360/core/utils/theme/theme.dart';
import 'package:hr360/core/utils/theme/widget_themes/text_theme.dart';
import 'package:hr360/features/main_screen/page/src/LoginScreen.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'core/utils/constants/colors.dart';
import 'di.dart';
import 'features/1_login/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'features/main_screen.dart';
import 'package:toastification/toastification.dart';

// Future<void> main() async {
//   // Initialize Hive
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Hive.initFlutter();
//
//     // Register adapters for custom classes
//     Hive.registerAdapter(UserDateAdapter());
//     Hive.registerAdapter(CustomerDateAdapter());
//     Hive.registerAdapter(ShipDataAdapter());
//     Hive.registerAdapter(LoginResponseAdapter());
//   } catch (e) {
//     print(e);
//   }
//
//   runApp(MyApp());
// }

class Get {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;
}

/// The main application widget.
class App extends StatelessWidget {
  final AppRouter appRouter;

  const App({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // BlocProvider(create: (context) => getIt<AuthCubit>()),
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
            child: ToastificationWrapper(
                child: MaterialApp.router(
              routerDelegate: appRouter.router.routerDelegate,
              routeInformationParser: appRouter.router.routeInformationParser,
              routeInformationProvider:
                  appRouter.router.routeInformationProvider,
              debugShowCheckedModeBanner: false,

              builder: (context, widget) {
                // Initialize text themes.
                TTextTheme.init(context, themeProvider);
                return Directionality(
                  textDirection: TextDirection.ltr, // Set text direction to RTL
                  child: MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1)),
                      child: widget!),
                );
              },
              // home: LoginScreen2(),
              title: TTexts.appName,
              themeMode: themeProvider.themeMode,
              theme: TAppTheme.lightTheme,
              color: AppColor.bgLight,
              darkTheme: TAppTheme.darkTheme,

              // home: const MainScreen(),
            )),
          );
        },
      ),
    );
  }
}
