import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/style.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../responsive.dart';
import '../shared/constants/defaults.dart';
import '../shared/widgets/sidemenu/tab_sidebar.dart';
import 'dashboard/dashboard_page.dart';

// final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _drawerKey,
      // drawer: Responsive.isMobile(context) ?  Sidebar() : null,
      body:
      Container(
        decoration: AppStyle.decorationPage,
        child: Row(
          children: [
          //  if (Responsive.isDesktop(context)) const Sidebar(),
            if (Responsive.isTablet(context)) const TabSidebar(),
            Expanded(
              child: Column(
                children: [
                //  Header(drawerKey: _drawerKey),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1360),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDefaults.padding * (Responsive.isMobile(context) ? 1 : 1.5),),
                            child: DashboardPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}
