import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hr360/features/ProfileScreen/UI/manger/profile_cubit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/routing/routes_gen.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/web_notificaion.dart';
import '../../2_dash_border/presentation/pages/shared/widgets/section_title.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.currentRoute});
  final AppRoutes currentRoute;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              showWebInWindowNotification(
                title: 'Notification',
                message: 'You have a notification  ${currentRoute.name}',
                data: {},

              );
            },
            child: SectionTitle(
              title: currentRoute.name.capitalize!,
              color: AppColor.colorList[
                  AppRoutes.values.indexWhere((route) => route == currentRoute)],
            ),
          ),
          // Text(
          //  'Welcome Pooran',
          //  style: TextStyle(
          //   fontSize: 24.sp,
          //   fontWeight: FontWeight.bold,
          //  ),
          // ),

          Row(
            children: [
              Container(
                width: 200.w,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Dashboard',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              const Icon(Iconsax.notification, color: Colors.black),
              SizedBox(width: 20.w),
              Icon(Iconsax.message, color: Colors.black),
              SizedBox(width: 20.w),
              Container(
                clipBehavior: Clip.hardEdge,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.white, shape: BoxShape.circle),
                child: ProfileCubit().userProfile?.avatar != null
                    ? Image.network(
                        ProfileCubit().userProfile!.avatar!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/illustration/signup_illustration.png',
                      ),
              ),
              SizedBox(width: 10.w),
              Skeletonizer(
                enabled: ProfileCubit().userProfile == null,justifyMultiLineText: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${ProfileCubit().userProfile?.firsName} ${ProfileCubit().userProfile?.lastName}",
                        style: AppStyle.heading3),
                    SizedBox(width: 8),
                    Text(ProfileCubit().userProfile?.roles ?? "",
                        style: AppStyle.bodyText),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ],
      ),
    );
  }
}
