import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../di.dart';
import '../../../../utils/theme/widget_themes/text_theme.dart';
import '../manager/home_bloc/home_bloc.dart';

enum PageType {
  dashboard,
  chat,
  users,
  report,
  category,
  setting,
  profile,
  logout
}

class MainBarControl {
  static bool isExpanded = false;
  static PageType currentPage = PageType.dashboard;
}

class MainBar extends StatefulWidget {
  const MainBar({Key? key}) : super(key: key);

  @override
  _MainBarState createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder:  (context, state) {
          return SizedBox(
          width: MainBarControl.isExpanded ? 180 : 60,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // color: AppColor.dark,
                height: TSizes.screenHeight * .1,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        MainBarControl.isExpanded = !MainBarControl.isExpanded;
                      });
                      // TODO: Handle navigation to the corresponding page
                    },
                    child: Text(
                      MainBarControl.isExpanded ? 'TITLE' : "T",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.sm,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildNavItem(
                      icon: Iconsax.home,
                      pageType: PageType.dashboard,
                      label: 'Dashboard'),
                  _buildNavItem(
                      icon: Iconsax.message,
                      pageType: PageType.chat,
                      label: 'Chat'),
                  _buildNavItem(
                      icon: Iconsax.profile_2user,
                      pageType: PageType.users,
                      label: 'Users'),
                  _buildNavItem(
                      icon: Iconsax.chart,
                      pageType: PageType.report,
                      label: 'Report'),
                  _buildNavItem(
                      icon: Iconsax.category,
                      pageType: PageType.category,
                      label: 'Category'),
                ],
              ),
              Spacer(),
              _buildNavItem(
                  icon: Iconsax.user, pageType: PageType.profile, label: 'Profile'),
              _buildNavItem(
                  icon: Iconsax.setting_2,
                  pageType: PageType.setting,
                  label: 'Setting'),
              SizedBox(
                height: 20.r,
              ),
              _buildNavItem(
                  icon: Iconsax.logout, pageType: PageType.logout, label: 'Logout'),
            ],
          ),
        );
      }
    );
  }

  Widget _buildNavItem(
      {required IconData icon,
      required PageType pageType,
      required String label}) {
    return InkWell(
        onTap: () {
          HomeBloc.get(context).changePage(context,pageType);
          // TODO: Handle navigation to the corresponding page
        },
        // onHover: ,
        child: Container(
          color: MainBarControl.currentPage == pageType
              ? Theme.of(context).splashColor
              : Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(TSizes.sm),
          margin: EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainBarControl.isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(icon),
              if (MainBarControl.isExpanded)
                SizedBox(
                  width: TSizes.xs,
                ),
              if (MainBarControl.isExpanded) Text(label),
            ],
          ),
        ));
  }
}
