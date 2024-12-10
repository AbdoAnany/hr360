import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/constants/colors.dart';
import '../../../shared/constants/defaults.dart';
import '../../../shared/constants/ghaps.dart';

class TabWithIcon extends StatelessWidget {
  const TabWithIcon({
    super.key,
    required this.title,
    required this.iconSrc,
    this.isSelected = false,
  });

  final bool isSelected;

  final String title, iconSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppDefaults.padding * 0.25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconSrc,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColor.iconBlack : AppColor.textLight,
              BlendMode.srcIn,
            ),
          ),
          gapW4,
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSelected ? AppColor.iconBlack : null,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
