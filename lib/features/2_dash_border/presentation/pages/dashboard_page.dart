import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/comments.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/get_more_customers.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/overview.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/popular_products.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/pro_tips.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/product_overview.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/dashboard/widgets/refund_request.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/pages/entry_point.dart';
import 'package:hr360/features/2_dash_border/presentation/pages/shared/constants/ghaps.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../responsive.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (!Responsive.isMobile(context)) gapH24,
          // Text(
          //   "Dashboard",
          //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
          // ),
          gapH20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Overview(),
                    gapH16,
                    const ProductOverviews(),
                    gapH16,
                    const ProTips(),
                    gapH16,
                    const GetMoreCustomers(),
                    if (Responsive.isMobile(context))
                       Column(
                        children: [
                          gapH16,
                          PopularProducts(),
                          gapH16,
                          Comments(),
                          gapH16,
                          RefundRequest(newRefund: 8, totalRefund: 52),
                          gapH8,
                        ],
                      ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) gapW16,
              if (!Responsive.isMobile(context))
                 Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PopularProducts(),
                      gapH16,
                      Comments(),
                      gapH16,
                      RefundRequest(newRefund: 8, totalRefund: 52),
                      gapH8,
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
