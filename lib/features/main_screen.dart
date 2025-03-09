import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/core_import.dart';
import 'package:hr360/features/main_screen/widget/header.dart';
import 'package:hr360/features/main_screen/widget/sidebar.dart';

import '../core/routing/app_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    print('MainScreen');
    return ValueListenableBuilder<AppRoutes>(
      valueListenable:  AppRouter().routeChangeNotifier,
      builder: (context, currentRoute, _) {
        return Scaffold(
          backgroundColor: AppColor.white,
          drawer:
          !Responsive.isDesktop(context)?
          Sidebar(
            onItemTapped: (route) => AppRouter().navigateTo(context, route),
            currentRoute: currentRoute,
          ):null
          ,
          body: Row(
            children: [
              if(Responsive.isDesktop(context))
              Sidebar(
                onItemTapped: (route) =>AppRouter().navigateTo(context, route),
                currentRoute: currentRoute,
              ),

              // Main content area
              Expanded(
                child: Column(
                  children: [
                    // Header with current route info
                    Header(currentRoute: currentRoute),

                    // Content area
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 12.0, left: 12),
                        decoration: AppStyle.decorationPage,
                        child:child

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



// Nested routing for the content area
class NestedRouterDelegate extends RouterDelegate<RouteSettings> with ChangeNotifier {
  final AppRoutes currentRoute;
  final Function(Route<dynamic>, dynamic) onPopPage;

  NestedRouterDelegate({
    required this.currentRoute,
    required this.onPopPage,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey(currentRoute.name),
          child: currentRoute.page,
        ),
      ],

    );
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) async {
    // This is never called as we're handling navigation through the AppRouter
    return;
  }

  @override
  RouteSettings get currentConfiguration => RouteSettings(name: currentRoute.routeName);

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }
}

class NestedRouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(RouteInformation routeInformation) async {
    return RouteSettings(name: routeInformation.location);
  }

  @override
  RouteInformation restoreRouteInformation(RouteSettings configuration) {
    return RouteInformation(location: configuration.name);
  }
}