import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../date/DashBoardCard.dart';
import '../../../widgets/Mainbar.dart';

List<DashBoardCard> cards = [
  DashBoardCard(
    icon:  Iconsax.briefcase,
    title: "Total Workforce",present: 10,
    subTitle: "vs last month",
    count: 150
  ),  DashBoardCard(
    icon:  Iconsax.activity,
    title: "Present Workforce",present: 20,
    subTitle: "vs last month",
    count: 125
  ),
  DashBoardCard(
    icon:  Iconsax.information,
    title: "Absent Workforce",present: -10,
    subTitle: "vs last month",
    count: 15
  ),  DashBoardCard(
    icon:  Iconsax.clock,
    title: "Late arrivals",present: 7,
    subTitle: "vs last month",
    count: 5
  ),DashBoardCard(
    icon:  Iconsax.bus,
    title: "On leave",present: 10,
    subTitle: "vs last month",
    count: 3
  ),
];

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    print(1.r);
    print(1.w);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40.h,),
          Wrap(
            runSpacing:     TSizes.lg24,
            spacing:   TSizes.lg24,
            crossAxisAlignment: WrapCrossAlignment.start,



            children:

            cards.map((e) =>    Container(

              padding: EdgeInsets.all(TSizes.lg24),
              width: 224.w,
              height: 168.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(TSizes.sm8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Icon(
                          e.icon,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:   TextSpan(
                          style: TextStyle(
                            fontSize: 12.0.w,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${e.present?.abs()}%',
                              style: TextStyle(
                                  fontSize: 12.0.w,
                                  fontWeight: FontWeight.w500,

                                  color:
                                  e.present!>0?AppColor.success:
                                  AppColor.error),
                            ),
                            TextSpan(
                              text: '  ${e.subTitle}',
                              style: TextStyle(
                                fontSize: 12.0.w,
                                //  fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                // decoration: TextDecoration.underline,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                 SizedBox(height:16.h ,),
                  Text("${e.title}" ,  style: TextStyle(
                    fontSize: 12.w,
                    fontWeight: FontWeight.w300,
                  ),),   SizedBox(height:4.h ,),
                  Text(
                    "${e.count}",
                    style: TextStyle(
                      fontSize: 32.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),).toList()


                ),



        ],
      ),
    );
  }
}
