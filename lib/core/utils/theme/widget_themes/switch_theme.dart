import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/theme/theme.dart';

class MySwitchTheme extends StatelessWidget {
  const MySwitchTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, them, c) {
      return Switch(
        value: them.isDarkModeEnabled,
        onChanged: (value) {
          them.isDarkModeEnabled = value;
          ThemeMode selectedThemeMode = them.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
          them.setThemeMode(selectedThemeMode);
        },
      );
    });
  }
}
