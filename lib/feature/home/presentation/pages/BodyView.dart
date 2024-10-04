import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/core/const.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/color.dart';
import '../../../../main.dart';
import '../manager/ItemBloc.dart';
import '../manager/ItemState.dart';
import '../widgets/ItemCard.dart';
import '../widgets/item_shimmer.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key, required this.horizontal});
  final double horizontal ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontal,vertical: 24),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Expanded(child: Text('Items', style: AppStyle.headingStyle,)),

                  CircleAvatar(
                    backgroundColor: AppColors.secondaryBgColor,radius: 25,
                    child: Image.asset(AppConst.filter,width: 16 ,height: 16,),
                  ),
                  if(horizontal>17)

                    Container(color: AppColors.dividerColor,
                    width: 1,height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  ),

                  if(horizontal>17)
                  ElevatedButton.icon(

                    label:Text('Add a New Item', style: AppStyle.titleBlackStyle,),
                    icon: Icon(Iconsax.add, color: AppColors.blackColor,),
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),),
                        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)),
                    onPressed: (){}, )

                ],
              ),
            ),
            BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state is ItemLoading) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: horizontal, vertical: 12),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(6, (_) => const ItemShimmer()),
                    ),
                  );
                } else if (state is ItemLoaded) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal:horizontal, vertical: 12),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: state.items.map((item) => ItemCard(item: item)).toList(),
                    ),
                  );
                } else if (state is ItemError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
