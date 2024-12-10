import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/constants/colors.dart';
import '../../../shared/constants/defaults.dart';
import '../../../shared/constants/extensions.dart';

class BenefitText extends StatelessWidget {
  const BenefitText({
    super.key,
    this.isTitle = false,
    required this.title,
    this.icon = 'assets/icons/check_circled_light.svg',
  });

  final bool isTitle;

  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
      ),
      leading: isTitle
          ? null
          : SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
              colorFilter: AppColor.success.toColorFilter,
            ),
      title: Text(
        title,
        style: isTitle
            ? Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)
            : null,
      ),
      titleAlignment: ListTileTitleAlignment.titleHeight,
    );
  }
}
