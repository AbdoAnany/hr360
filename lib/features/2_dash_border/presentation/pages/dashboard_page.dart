
import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/shared/navigation/routes.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/theme/app_theme.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'HR360',
      theme: AppTheme.light(context),
      routerConfig: routerConfig,
    );
  }
}
