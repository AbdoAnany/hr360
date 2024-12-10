import 'package:flutter/material.dart';

// Import your page widgets here
import '../../features/2_dash_border/presentation/pages/dashboard_page.dart';
import '../../features/2_dash_border/presentation/pages/pages/entry_point.dart';
import '../../features/3_academics/presentation/pages/PrimarySchoolClassesPage.dart';
import '../../features/3_academics/presentation/pages/academics_screen.dart';
import '../../features/4_user/presentation/pages/UserPage.dart';
import '../../features/home/presentation/pages/pages/Employee/employees.dart';
import '../../features/main_screen/page/AccountsPage.dart';
import '../../features/main_screen/page/AnalyticsPage.dart';
import '../../features/main_screen/page/AttendancePage.dart';
import '../../features/main_screen/page/CalendarPage.dart';
import '../../features/main_screen/page/LeadsPage.dart';
import '../../features/main_screen/page/SupportPage.dart';
import '../../features/main_screen/page/VisitorsPage.dart';
// app_routes.dart
enum AppRoutes {
  dashboard,
  academics,
  accounts,
  support,
  employees,   // Changed from students to employees
  attendance,
  analytics,
  user,        // Changed from team to user
  calendar,
  leads,
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
    }
  }

  Widget get page {
    switch (this) {
      case AppRoutes.dashboard:
        return const DashboardPage();
      // case AppRoutes.academics:
      //   return const AcademicsScreen();
        case AppRoutes.academics:
        return  PrimarySchoolClassesPage();
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

// route_config.dart
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  try {
    final route = AppRoutes.values.firstWhere(
          (route) => route.routeName == settings.name,
      orElse: () => AppRoutes.dashboard,
    );

    return MaterialPageRoute(
      builder: (_) => route.page,
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
        return const DashboardPage();
      case AppRoutes.academics:
        return  PrimarySchoolClassesPage();
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


