import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          "What are you\ncooking today?",
          style: TextStyle(
            fontSize: 32.r,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},

          icon: const Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
