import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:hr360/features/ProfileScreen/UI/manger/profile_cubit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/routing/app_router.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/keys.dart';
import '../../../core/utils/local_storage/storage_utility.dart';
import '../../../core/utils/web_notificaion.dart';
import '../../../di.dart';
import '../../../responsive.dart';
import '../../1_login/presentation/blocs/auth_cubit/auth_cubit.dart';
import '../../2_dash_border/presentation/pages/shared/widgets/section_title.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.currentRoute});
  final AppRoutes currentRoute;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 20,
        vertical: isMobile ? 8: 12,
      ),
      color: Colors.white,
      child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionTitle(),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Iconsax.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            _buildSectionTitle(),
          ],
        ),
        Spacer(flex: 1),
        SizedBox(height: 8.h),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildSectionTitle() {
    return InkWell(
      onTap: () {
        showWebInWindowNotification(
          title: 'Notification',
          message: 'You have a notification ${currentRoute.name}',
          data: {},
        );
      },
      child: SectionTitle(
        title: currentRoute.name.capitalize!,
        color: AppColor.colorList[
        AppRoutes.values.indexWhere((route) => route == currentRoute)],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      mainAxisAlignment: isMobile ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.end,
      children: [
        if (!isMobile) ...[
          // Uncomment if needed
          // _buildIconButton(Iconsax.notification, 'Notifications'),
          // SizedBox(width: 16.w),
          // _buildIconButton(Iconsax.message, 'Messages'),
          // SizedBox(width: 16.w),
        ],
        _buildUserProfile(context),
        SizedBox(width: isMobile ? 8.w : 16.w),
        _buildLogoutButton(context),
      ],
    );
  }
  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.error.withOpacity(.07),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        tooltip: 'Logout',
        onPressed: () {
          getIt<AuthCubit>().logOut(context);
        },
        icon: const Icon(
          Iconsax.logout,
          color: AppColor.error,
          size: 20,
        ),
      ),
    );
  }
  Widget _buildUserProfile(BuildContext context) {
    final profile = UserModel.fromJson(getIt<TLocalStorage>().readData(AppKeys.userDataLogin) ?? {});
    final isMobile = Responsive.isMobile(context);

    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: isMobile ? 32 : 40,
          height: isMobile ? 32 : 40,
          decoration: const BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
          ),
          child: profile.avatar != null
              ? Image.network(
            profile.avatar!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/illustration/signup_illustration.png',
            ),
          )
              : Image.asset('assets/images/illustration/signup_illustration.png'),
        ),
        if (!isMobile) ...[
          SizedBox(width: 10.w),
          Skeletonizer(
            enabled: profile == null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profile.firstName ?? ''} ${profile.lastName ?? ''}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: Responsive.isMobile(context) ? 16 : 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  profile.role ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
// _buildIconButton and _buildUserProfile as shown above
// _buildLogoutButton remains unchanged
}