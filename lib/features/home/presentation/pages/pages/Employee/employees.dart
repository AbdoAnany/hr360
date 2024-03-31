import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/Mainbar.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40,),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(TSizes.md16),
              padding: EdgeInsets.all(TSizes.lg24),
              width: 225,
              height: 171,
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
                          Iconsax.briefcase,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:  const TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '10%',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,

                                  color: AppColor.success),
                            ),
                            TextSpan(
                              text: ' vs last month',
                              style: TextStyle(
                                fontSize: 12.0,
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
                  SizedBox(height: 16,),
                  Text("Total Workforce" ,  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    ),),
                  Text(
                    "150",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(TSizes.md16),
              padding: EdgeInsets.all(TSizes.lg24),
              width: 225,
              height: 171,
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
                          Iconsax.briefcase,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:  const TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '10%',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,

                                  color: AppColor.error),
                            ),
                            TextSpan(
                              text: ' Present Workforce',
                              style: TextStyle(
                                fontSize: 12.0,
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
                  SizedBox(height: 16,),
                  Text("Total Workforce" ,  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    ),),
                  Text(
                    "150",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(TSizes.md16),
              padding: EdgeInsets.all(TSizes.lg24),
              width: 225,
              height: 171,
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
                          Iconsax.airplane,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:  const TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '10%',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,

                                  color: AppColor.success),
                            ),
                            TextSpan(
                              text: '  vs last month',
                              style: TextStyle(
                                fontSize: 12.0,
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
                  SizedBox(height: 16,),
                  Text("On leave" ,  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    ),),
                  Text(
                    "5",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),       Container(
              margin: EdgeInsets.all(TSizes.md16),
              padding: EdgeInsets.all(TSizes.lg24),
              width: 225,
              height: 171,
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
                          Iconsax.airplane,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:  const TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '10%',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,

                                  color: AppColor.success),
                            ),
                            TextSpan(
                              text: '  vs last month',
                              style: TextStyle(
                                fontSize: 12.0,
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
                  SizedBox(height: 16,),
                  Text("On leave" ,  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    ),),
                  Text(
                    "5",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),       Container(
              margin: EdgeInsets.all(TSizes.md16),
              padding: EdgeInsets.all(TSizes.lg24),
              width: 225,
              height: 171,
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
                          Iconsax.airplane,
                          color: AppColor.primary,
                        ),
                      ),
                      RichText(
                        text:  const TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '10%',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,

                                  color: AppColor.success),
                            ),
                            TextSpan(
                              text: '  vs last month',
                              style: TextStyle(
                                fontSize: 12.0,
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
                  SizedBox(height: 16,),
                  Text("On leave" ,  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    ),),
                  Text(
                    "5",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
