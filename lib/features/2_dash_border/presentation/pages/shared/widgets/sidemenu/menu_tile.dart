import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/constants/colors.dart';
import '../../../shared/constants/defaults.dart';


class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.title,
    this.activeIconSrc,
    this.inactiveIconSrc,
    required this.onPressed,
    this.isActive = false,
    this.isSubmenu = false,
    this.count,
    this.countBg = AppColor.secondaryMintGreen,
  });

  final String title;
  final String? inactiveIconSrc, activeIconSrc;
  final VoidCallback onPressed;
  final bool isActive, isSubmenu;
  final int? count;
  final Color countBg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isSubmenu ? AppDefaults.padding * 2 : 0,
          right: isSubmenu ? AppDefaults.padding : 0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColor.highlightLight : null,
          borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: AppColor.textGrey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
          ],
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          ),
          onTap: onPressed,
          leading: activeIconSrc != null
              ? SvgPicture.asset(
                  (isActive || inactiveIconSrc == null)
                      ? activeIconSrc!
                      : inactiveIconSrc!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? Theme.of(context).iconTheme.color!
                          : Theme.of(context).textTheme.bodyMedium!.color!,
                      BlendMode.srcIn),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? AppColor.titleLight : AppColor.textLight,
            ),
          ),
          trailing: count != null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding / 2,
                      vertical: AppDefaults.padding / 4),
                  decoration: BoxDecoration(
                    color: countBg,
                    borderRadius:
                        BorderRadius.circular(AppDefaults.borderRadius / 2),
                  ),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
