import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/2_dash_border/core_import.dart';
import 'package:hr360/features/main_screen/page/AccountsPage.dart';
import 'package:hr360/features/main_screen/page/AnalyticsPage.dart';
import 'package:hr360/features/main_screen/page/AttendancePage.dart';
import 'package:hr360/features/main_screen/page/CalendarPage.dart';
import 'package:hr360/features/main_screen/page/LeadsPage.dart';
import 'package:hr360/features/main_screen/page/SupportPage.dart';
import 'package:hr360/features/main_screen/page/VisitorsPage.dart';
import 'package:hr360/features/main_screen/widget/header.dart';
import 'package:hr360/features/main_screen/widget/sidebar.dart';
import 'package:provider/provider.dart';

import '../../core/routing/routes_gen.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/constants/style.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../../core/utils/theme/theme.dart';
import '../../di.dart';
import '../2_dash_border/presentation/pages/dashboard_page.dart';
import '../2_dash_border/presentation/pages/pages/entry_point.dart';
import '../3_academics/presentation/manager/course_bloc.dart';
import '../3_academics/presentation/pages/academics_screen.dart';
import '../4_user/presentation/manager/bloc/user_bloc.dart';
import '../4_user/presentation/pages/UserPage.dart';
import '../home/presentation/pages/pages/Employee/employees.dart';

// final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppRoutes _currentRoute = AppRoutes.dashboard;

  void _onItemTapped(AppRoutes route) {
    setState(() {
      _currentRoute = route;
    });
    navigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route.page;
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
    // Use custom animated navigation
    // _navigatorKey.currentState?.pushReplacement(
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) {
    //       return route.page; // Provide the target page here
    //     },
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       const begin = Offset(1.0, 0.0); // Start animation from the right
    //       const end = Offset.zero;        // End animation at the current position
    //       const curve = Curves.easeInOut; // Animation curve
    //
    //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //       var offsetAnimation = animation.drive(tween);
    //
    //       return SlideTransition(
    //         position: offsetAnimation,
    //         child: child,
    //       );
    //     },
    //     transitionDuration: const Duration(milliseconds: 300), // Animation duration
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Row(
        children: [
          // Sidebar
          Sidebar(
            onItemTapped: _onItemTapped,
            currentRoute: _currentRoute,
          ),

          // Main content area
          Expanded(
            child: Column(
              children: [
                Header(),
                Expanded(
                  child: Container(
                   padding: const EdgeInsets.only(top: 8.0,left: 8),
                    decoration: AppStyle.decorationPage,clipBehavior: Clip.hardEdge,
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) {

                        print('Initialize theme and screen utilities');
                        // // Initialize theme and screen utilities
                        themeProvider.getThemeMode();
                        TSizes.init(context: context);
                        return Navigator(
                          key: navigatorKey,
                          initialRoute: AppRoutes.dashboard.routeName,
                          onGenerateRoute: onGenerateRoute,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// Update your route configuration to handle the nested navigation
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  try {
    final route = AppRoutes.values.firstWhere(
      (route) => route.routeName == settings.name,
      orElse: () => AppRoutes.dashboard,
    );

    // Create the page based on the route
    Widget page = route.page;

    // Wrap the page with necessary providers if needed
    if (route == AppRoutes.academics) {
      page = BlocProvider(
        create: (context) => getIt<CourseBloc>(),
        child: page,
      );
    } else if (route == AppRoutes.user) {
      page = BlocProvider(
        create: (context) => getIt<UserBloc>(),
        child: page,
      );
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  } catch (e) {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}

// Add this to your AppRoutes enum if not already present
extension AppRouteWidget on AppRoutes {
  Widget get page {
    switch (this) {
      case AppRoutes.dashboard:
        return const EntryPoint();
      case AppRoutes.academics:
        return const AcademicsScreen();
      case AppRoutes.accounts:
        return AccountsPage();
      case AppRoutes.support:
        return SupportPage();
      case AppRoutes.employees:
        return const EmployeesScreen();
      case AppRoutes.attendance:
        return AttendancePage();
      case AppRoutes.analytics:
        return const AnalyticsPage();
      case AppRoutes.user:
        return const UserPage();
      case AppRoutes.calendar:
        return const CalendarPage();
      case AppRoutes.leads:
        return const LeadsPage();
      case AppRoutes.visitors:
        return const VisitorsPage();
    }
  }
}
