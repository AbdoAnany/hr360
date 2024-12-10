import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/core_import.dart';
import 'package:hr360/features/main_screen/widget/header.dart';
import 'package:hr360/features/main_screen/widget/sidebar.dart';
import 'package:provider/provider.dart';

import '../../core/routing/routes_gen.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../../core/utils/theme/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppRoutes _currentRoute = AppRoutes.dashboard;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(AppRoutes route) {
    setState(() {
      _currentRoute = route;
    });
    THelperFunctions.navigateToScreen(route.page);
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
                Header(currentRoute: _currentRoute),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    decoration: AppStyle.decorationPage,
                    // clipBehavior: Clip.hardEdge,

                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) {
                        themeProvider.getThemeMode();
                        TSizes.init(context: context);
                        return Navigator(
                          key: navigatorKey,pages: AppRoutes.values.map((route) => MaterialPage(child: route.page)).toList(),
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
