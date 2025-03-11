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
import '../../1_login/presentation/blocs/auth_cubit/auth_cubit.dart';
import '../../2_dash_border/presentation/pages/shared/widgets/section_title.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.currentRoute});
  final AppRoutes currentRoute;

  @override
  Widget build(BuildContext context) {
    // Get screen width to adjust layout based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      color: Colors.white,
      child: isSmallScreen
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
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
    return Column(
      children: [
        _buildSectionTitle(),
        SizedBox(height: 10.h),
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
        AppRoutes.values.indexWhere((route) => route == currentRoute)
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompactLayout = screenWidth < 800;

    return Row(
      mainAxisAlignment: isCompactLayout
          ? MainAxisAlignment.center
          : MainAxisAlignment.end,
      children: [
        // _buildIconButton(Iconsax.notification, 'Notifications'),
        // SizedBox(width: 16.w),
        // _buildIconButton(Iconsax.message, 'Messages'),
        SizedBox(width: 16.w),
        _buildUserProfile(context),
        SizedBox(width: 16.w),
        _buildLogoutButton(context),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _buildUserProfile(context) {
    // await getIt<TLocalStorage>().saveData<Map<String, dynamic>>(AppKeys.userDataLogin, data.toJson()).then((e) {
    final  date = getIt<TLocalStorage>().readData(AppKeys.userDataLogin);
    print('data  >> . :  ${date}');
    final UserModel  profile = UserModel.fromJson(date);

    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
          ),
          child: profile.avatar != null
              ? Image.network(
            profile.avatar??'',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
             Image.asset(
              'assets/images/illustration/signup_illustration.png',
            ),
          )
              : Image.asset(
            'assets/images/illustration/signup_illustration.png',
          ),
        ),
        SizedBox(width: 10.w),
        Skeletonizer(
          enabled: profile == null,
          justifyMultiLineText: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${profile.firstName ?? ''} ${profile.lastName ?? ''}",
                style: Theme.of(context).textTheme.titleLarge,
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
}