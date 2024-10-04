import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 243,
        height: 322,
        color: Colors.white,
      ),
    );
  }
}
