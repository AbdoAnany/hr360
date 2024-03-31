import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hr360/utils/theme/widget_themes/text_theme.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/theme/style.dart';
import '../../../../../utils/theme/theme.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor, borderRadius:  BorderRadius.circular(TSizes. borderRadiusLg)),
      child: TextField(
        decoration: InputDecoration(isDense: true,
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: Theme.of(context).iconTheme.color,),
          hintText: "Search any recipes",
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
