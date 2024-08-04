import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/1login/blocs/auth_cubit/auth_cubit.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/core/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../manager/home_bloc/home_bloc.dart';

enum PageType {
  Dashboard,
  chat,
  Employees,
  report,
  category,
  Setting,
  profile,
  signup,
  logout,
  custom
}

class MainBarControl {
  static bool isExpanded = true;
  static PageType currentPage = PageType.Dashboard;
}

class MainBar extends StatefulWidget {
  const MainBar({Key? key}) : super(key: key);

  @override
  _MainBarState createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return SizedBox(
        width: MainBarControl.isExpanded ? 220.w : 58.w,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MainBarHeader(),
            SizedBox(
              height: TSizes.sm8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                    icon: Iconsax.home,
                    pageType: PageType.Dashboard,
                    label: 'Dashboard'),
                _buildNavItem(
                    icon: Iconsax.profile_2user,
                    pageType: PageType.Employees,
                    label: 'Employees'),
                _buildNavItem(
                    icon: Iconsax.message,
                    pageType: PageType.chat,
                    label: 'Chat'),
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
                icon: Iconsax.user,
                pageType: PageType.profile,
                label: 'Profile'),
            _buildNavItem(
                icon: Iconsax.setting_2,
                pageType: PageType.Setting,
                label: 'Setting'),
            SizedBox(
              height: 20.h,
            ),
            _buildNavItem(
                icon: Iconsax.logout,
                pageType: PageType.logout,
                onTap: (){
                  AuthCubit.get(context).logOut();
                },
                label: 'Logout'),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNavItem(
      {required IconData icon,
        required PageType pageType,
        required String label,
        void Function()? onTap}) {
    return InkWell(
      onTap: onTap ?? () {
        print(pageType.name);
        HomeCubit.get(context).changePage(pageType);
      },
      child: Container(

        width: MainBarControl.isExpanded ? 200.w : 58.w,
        decoration: BoxDecoration(
          color: MainBarControl.currentPage == pageType
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(TSizes.sm8),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainBarControl.isExpanded
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: MainBarControl.currentPage == pageType
                    ? AppColor.white
                    : AppColor.black),
            if (MainBarControl.isExpanded)
              SizedBox(
                width: TSizes.xs4,
              ),
            if (MainBarControl.isExpanded)
              Text(
                label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: MainBarControl.currentPage == pageType
                        ? AppColor.white
                        : AppColor.black),
              ),
          ],
        ),
      ),
    );
  }
}

class MainBarHeader extends StatelessWidget {
  const MainBarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // setState(() {
        //   MainBarControl.isExpanded = !MainBarControl.isExpanded;
        // });
        // TODO: Handle navigation to the corresponding page
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.lg24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TImages.lightAppLogo, width: 40.w, height: 40.w),
            if (MainBarControl.isExpanded)
              SizedBox(
                width: 12.w,
              ),
            if (MainBarControl.isExpanded)
              Text(
                'HR.360',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}
