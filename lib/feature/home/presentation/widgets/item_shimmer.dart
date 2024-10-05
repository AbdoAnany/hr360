import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/repositories/ItemRepository.dart';
import 'ItemCard.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Skeletonizer(
      enabled: true,child:
    Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start ,
      spacing: MediaQuery.of(context).size.width > 1100 ? 24 : 16, // Adjust based on screen
      runSpacing: MediaQuery.of(context).size.width > 1100 ? 24 : 16,
      children: listItemCards.map((item) => ItemCard(item:  item)).toList(),
    ),
    );
  }
}
