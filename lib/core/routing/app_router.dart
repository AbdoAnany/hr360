import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr360/features/ProfileScreen/UI/ProfileScreen.dart';
import '../../features/0_intro/presentation/pages/SplashScreen.dart';
import '../../features/1_login/data/user_model.dart';
import '../../features/1_login/presentation/page/login.dart';
import '../../features/2_dash_border/presentation/pages/dashboard_page.dart';
import '../../features/2_dash_border/presentation/pages/pages/entry_point.dart';
import '../../features/3_academics/presentation/pages/PrimarySchoolClassesPage.dart';
import '../../features/3_academics/presentation/pages/academics_screen.dart';
import '../../features/4_user/presentation/pages/UserPage.dart';
import '../../features/home/presentation/pages/pages/Employee/employees.dart';
import '../../features/main_screen.dart';
import '../../features/main_screen/page/AccountsPage.dart';
import '../../features/main_screen/page/AnalyticsPage.dart';
import '../../features/main_screen/page/AttendancePage.dart';
import '../../features/main_screen/page/CalendarPage.dart';
import '../../features/main_screen/page/LeadsPage.dart';
import '../../features/main_screen/page/SupportPage.dart';
import '../../features/main_screen/page/VisitorsPage.dart';
import '../../features/2_dash_border/presentation/pages/dashboard_page.dart';
import '../../features/3_academics/presentation/pages/PrimarySchoolClassesPage.dart';
import '../../features/main_screen/page/AccountsPage.dart';
import '../../features/main_screen/page/SupportPage.dart';
// Core authentication handling
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Core authentication handling
class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

// Route configuration
class AppRouter {
  // Singleton pattern
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  AppRouter._internal();

  // Navigator keys
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  // Auth notifier for login state management
  final authNotifier = AuthNotifier();

  // Current route for main screen navigation
  AppRoutes _currentRoute = AppRoutes.dashboard;
  AppRoutes get currentRoute => _currentRoute;

  // Route change notifier
  final routeChangeNotifier = ValueNotifier<AppRoutes>(AppRoutes.dashboard);

  // Error widget
  Widget errorWidget(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Oops! The page you are looking for does not exist.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  // Page transitions
  CustomTransitionPage<dynamic> buildPageTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    TransitionType transitionType = TransitionType.fade,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.fade:
            return FadeTransition(opacity: animation, child: child);
          case TransitionType.slide:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.scale:
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          case TransitionType.none:
            return child;
        }
      },
    );
  }

  // Router configuration
  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: authNotifier,
    redirect: _redirectLogic,
    errorBuilder: errorWidget,
    routes: _buildRoutes(),
  );

  // Redirect logic
  String? _redirectLogic(BuildContext context, GoRouterState state) {
    // The current location
    final currentLocation = state.matchedLocation;

    // Check if we're logging out
    final isLoggingOut = state.extra is Map && (state.extra as Map)['clearHistory'] == true;

    // Check if user data is available
    // Replace this with your actual authentication check
    final bool isLoggedIn = authNotifier.isLoggedIn;

    // Check if we're on an auth route
    // final isAuthRoute = currentLocation == '/' ||
    //     currentLocation == '/login' ||
    //     currentLocation == '/register' ||
    //     currentLocation == '/forgot-password';
    //
    // // If not logged in and not on an auth route, redirect to login
    // if (!isLoggedIn && !isAuthRoute) {
    //   return '/login';
    // }

    // // If logged in and on an auth route, redirect to dashboard
    // if (isLoggedIn && isAuthRoute && !isLoggingOut) {
    //   return '/dashboard';
    // }

    // No redirection needed
    return null;
  }

  // Build routes
  List<RouteBase> _buildRoutes() {
    return [
      // Auth routes
      GoRoute(
        name: 'splash',
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        pageBuilder: (context, state) => buildPageTransition(
          context: context,
          state: state,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        name: 'forgot-password',
        path: '/forgot-password',
        pageBuilder: (context, state) => buildPageTransition(
          context: context,
          state: state,
          child: const ForgotPasswordScreen(),
        ),
      ),

      // Main app shell
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          // Get the current route from the path
          final currentPath = state.matchedLocation;
          for (final route in AppRoutes.values) {
            if (currentPath.startsWith(route.routeName)) {
              _currentRoute = route;
              routeChangeNotifier.value = route;
              break;
            }
          }

          // Main layout with sidebar and header
          return  MainScreen(child: child,);
        },
        routes: _buildAppRoutes(),
      ),
    ];
  }

  // Build app routes from enum
  List<RouteBase> _buildAppRoutes() {
    final List<RouteBase> routes = [];

    // Add routes for each app route enum
    for (final route in AppRoutes.values) {
      routes.add(
        GoRoute(
          name: route.name,
          path: route.routeName,
          pageBuilder: (context, state) => buildPageTransition(
            context: context,
            state: state,
            child: route.page,
            transitionType: route.transitionType,
          ),
        ),
      );

      // Add sub-routes if needed
      if (route.hasSubRoutes) {
        for (final subRoute in route.subRoutes) {
          routes.add(
            GoRoute(
              name: '${route.name}_${subRoute.name}',
              path: '${route.routeName}${subRoute.path}',
              pageBuilder: (context, state) {
                // Handle parameters if needed
                final params = state.pathParameters;
                return buildPageTransition(
                  context: context,
                  state: state,
                  child: subRoute.buildPage(params),
                  transitionType: subRoute.transitionType,
                );
              },
            ),
          );
        }
      }
    }

    return routes;
  }

  // Navigation helpers
  void navigateTo(BuildContext context, AppRoutes route, {Map<String, String>? params}) {
    _currentRoute = route;
    routeChangeNotifier.value = route;
    print('navigateTo route.name ${route.name}');
    context.goNamed(route.name, pathParameters: params ?? {});
  }
  void navigateWithTransition(BuildContext context, AppRoutes route, {Map<String, String>? params}) {
    _currentRoute = route;
    routeChangeNotifier.value = route;
    print('navigateWithTransition route.name ${route.name}');
    context.pushNamed(route.name, pathParameters: params ?? {});
  }

  // New method to navigate and replace current screen
  void navigateAndReplaceScreen(BuildContext context, AppRoutes route, {Map<String, String>? params}) {
    _currentRoute = route;
    routeChangeNotifier.value = route;
    router.replaceNamed(route.name, pathParameters: params ?? {});
  }
  // Navigate to sub-route
  void navigateToSubRoute(BuildContext context, AppRoutes parentRoute, String subRouteName, {Map<String, String>? params}) {
    _currentRoute = parentRoute;
    routeChangeNotifier.value = parentRoute;
    context.goNamed('${parentRoute.name}_$subRouteName', pathParameters: params ?? {});
  }
  void goBack(BuildContext context) {
    // Simple method to go back to the previous screen
    context.pop(context);
  }

// Method 2: More robust method with optional result passing
  void goBackWithResult<T>(BuildContext context, [T? result]) {
    // Go back to the previous screen and optionally pass a result
    // router.of(context).pop(result);
  }

  void logout(BuildContext context) {
    // Clear user data
    authNotifier.setLoggedIn(false);

    // Navigate to login and clear history
    context.go('/login', extra: {'clearHistory': true});
  }
}

// Transition types
enum TransitionType {
  fade,
  slide,
  scale,
  none,
}

// Enhanced AppRoutes with more configuration options
enum AppRoutes {
  dashboard,
  academics,
  accounts,
  support,
  employees,
  attendance,
  analytics,
  user,
  calendar,
  leads,
  profile,
  visitors;

  String get routeName {
    switch (this) {
      case AppRoutes.dashboard:
        return '/dashboard';
      case AppRoutes.academics:
        return '/academics';
      case AppRoutes.accounts:
        return '/accounts';
      case AppRoutes.support:
        return '/support';
      case AppRoutes.employees:
        return '/employees';
      case AppRoutes.attendance:
        return '/attendance';
      case AppRoutes.analytics:
        return '/analytics';
      case AppRoutes.user:
        return '/user';
      case AppRoutes.calendar:
        return '/calendar';
      case AppRoutes.leads:
        return '/leads';
      case AppRoutes.visitors:
        return '/visitors';
      case AppRoutes.profile:
    return '/profile/:userId';
      default:
        return '/dashboard';
    }
  }

  Widget get page {
    switch (this) {
      case AppRoutes.dashboard:
        return const DashboardPage();
      case AppRoutes.academics:
        return PrimarySchoolClassesPage();
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
        case AppRoutes.profile:
        return  ProfileScreen();
      default:
        return const DashboardPage();
    }
  }

  TransitionType get transitionType {
    // Default transition for each route
    return TransitionType.fade;
  }

  // Sub-routes configuration
  bool get hasSubRoutes {
    switch (this) {
      case AppRoutes.academics:
      case AppRoutes.employees:
      case AppRoutes.profile:
        return true;
      default:
        return false;
    }
  }

  List<SubRoute> get subRoutes {
    switch (this) {
      case AppRoutes.academics:
        return [
          SubRoute(
            name: 'class',
            path: '/class/:id',
            buildPage: (params) => ClassDetailPage(classId: int.tryParse(params['id'] ?? '0') ?? 0),
          ),
          SubRoute(
            name: 'student',
            path: '/student/:id',
            buildPage: (params) => StudentDetailPage(studentId: int.tryParse(params['id'] ?? '0') ?? 0),
          ),

        ];
      case AppRoutes.employees:
        return [
          SubRoute(
            name: 'details',
            path: '/:id',
            buildPage: (params) => EmployeeDetailScreen(employeeId: int.tryParse(params['id'] ?? '0') ?? 0),
          ),
          SubRoute(
            name: 'edit',
            path: '/edit/:id',
            buildPage: (params) => EmployeeEditScreen(employeeId: int.tryParse(params['id'] ?? '0') ?? 0),
          ),
        ];
      case AppRoutes.profile:
        return [
          SubRoute(
            name: 'details',
            path: '',
            buildPage: (params) => ProfileScreen(userDetails: UserModel(
              userId: params['userId'] ?? '0',
            )),
          ),
        ];

      default:
        return [];
    }
  }
}

// Sub-route class for nested routes
class SubRoute {
  final String name;
  final String path;
  final Widget Function(Map<String, String>) buildPage;
  final TransitionType transitionType;

  const SubRoute({
    required this.name,
    required this.path,
    required this.buildPage,
    this.transitionType = TransitionType.fade,
  });
}







class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Register Screen'),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Forgot Password Screen'),
      ),
    );
  }
}

// class MainScreen extends StatelessWidget {
//   final Widget child;
//
//   const MainScreen({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: child,
//     );
//   }
// }

class ClassDetailPage extends StatelessWidget {
  final int classId;

  const ClassDetailPage({Key? key, required this.classId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Class Detail Page: $classId'),
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final int studentId;

  const StudentDetailPage({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Student Detail Page: $studentId'),
      ),
    );
  }
}

class EmployeeDetailScreen extends StatelessWidget {
  final int employeeId;

  const EmployeeDetailScreen({Key? key, required this.employeeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Employee Detail Screen: $employeeId'),
      ),
    );
  }
}

class EmployeeEditScreen extends StatelessWidget {
  final int employeeId;

  const EmployeeEditScreen({Key? key, required this.employeeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Employee Edit Screen: $employeeId'),
      ),
    );
  }
}