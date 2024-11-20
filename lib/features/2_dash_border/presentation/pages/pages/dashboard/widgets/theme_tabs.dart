import 'package:hr360/features/2_dash_border/core_import.dart';

import 'package:flutter/material.dart';

import '../../../../../../../core/utils/theme/theme.dart';
import '../../../shared/widgets/tabs/tab_with_icon.dart';
import 'package:provider/provider.dart';

class ThemeTabs extends StatefulWidget {
  const ThemeTabs({super.key});

  @override
  State<ThemeTabs> createState() => _ThemeTabsState();
}

class _ThemeTabsState extends State<ThemeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      });
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<ThemeProvider>(builder: (context, them, c) {
        return
          Container(
            decoration: BoxDecoration(
              color: AppColor.bgLight,
              borderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
            ),
            child: TabBar(
              controller: _tabController,
              dividerHeight: 0,
              splashBorderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding * 0.5,
                vertical: AppDefaults.padding * 0.5,
              ),
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppDefaults.borderRadius * 5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ],
                color: AppColor.bgSecondayLight,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              onTap:  (value) {
        them.isDarkModeEnabled = value==1;
        ThemeMode selectedThemeMode = them.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
        them.setThemeMode(selectedThemeMode);
      },
              tabs: [
                TabWithIcon(
                  isSelected:  !them.isDarkModeEnabled,
                  title: 'Light',
                  iconSrc: 'assets/icons/sun_filled.svg',
                ),
                TabWithIcon(
                  isSelected:  them.isDarkModeEnabled,
                  title: 'Dark',
                  iconSrc: 'assets/icons/moon_light.svg',
                ),
              ],
            ),
          );


        //   Switch(
        //   value: them.isDarkModeEnabled,
        //   onChanged: (value) {
        //     them.isDarkModeEnabled = value;
        //     ThemeMode selectedThemeMode = them.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
        //     them.setThemeMode(selectedThemeMode);
        //   },
        // );
      })

  ;
  }
}
