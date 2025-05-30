import 'package:hr360/features/2_dash_border/core_import.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefundRequest extends StatelessWidget {
  const RefundRequest({
    super.key,
    required this.newRefund,
    required this.totalRefund,
  });

  final int totalRefund, newRefund;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDefaults.borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppDefaults.padding * 0.75),
      child: Column(
        children: [
          gapH8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Refund requests",
              color: AppColor.secondaryPeach,
            ),
          ),
          gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColor.secondaryMistyrose,
                  child: SvgPicture.asset(
                    'assets/icons/basket_light.svg',
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColor.error,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                gapW8,
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "You have ",
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColor.textGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "$totalRefund open refund requests",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: " to action. This includes ",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.textGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "$newRefund new requests.",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: " 👀",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.textGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapH24,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Review refund requests",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
