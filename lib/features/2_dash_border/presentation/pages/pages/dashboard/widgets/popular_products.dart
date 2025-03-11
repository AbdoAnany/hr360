import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr360/features/2_dash_border/core_import.dart';

import '../../../../../../1_login/data/user_model.dart';
import '../../../../../../main_screen/page/src/ChatScreen.dart';
import '../../../../../../main_screen/page/src/user_service.dart';
import 'popular_product_item.dart';

class PopularProducts extends StatelessWidget {
   PopularProducts({super.key});
  final UserService _userService = UserService();

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
              title: "System Users",
              color: AppColor.secondaryLavender,
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Users', style: Theme.of(context).textTheme.labelSmall),
                Text('State', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          gapH8,
          const Divider(),
          StreamBuilder<QuerySnapshot>(
            stream: _userService.getUsersByRole("student"),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

              List students = snapshot.data!.docs;

              return   ListView.builder(
                itemCount:students.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  UserModel student = UserModel.fromFirestore(students[index]);
                  return PopularProductItem(
                    name: student.firstName??"",
                    price: '\$2,453.80',
                    imageSrc:
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                    isActive: student.status == 'active',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            senderId: _userService.getCurrentUserId(),
                            receiverId: student.userId??'',
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),

          gapH16,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "All Users",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
