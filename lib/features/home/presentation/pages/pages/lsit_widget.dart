import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class WidgetList extends StatelessWidget {
  const WidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.chevron_back),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.search_normal_1),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.home_1),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.folder_favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.bookmark),
          ),
        ],
      ),
    );
  }
}
