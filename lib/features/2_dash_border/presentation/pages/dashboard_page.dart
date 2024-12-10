import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/entry_point.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/theme/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, them, c) {
      return const EntryPoint();
    });
  }
}
