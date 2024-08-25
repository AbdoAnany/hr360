import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/shared/navigation/routes.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/theme/app_theme.dart';

import '../../../../core/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, them, c) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: them.themeMode,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        routerConfig: routerConfig,
      );
    });
  }
}
