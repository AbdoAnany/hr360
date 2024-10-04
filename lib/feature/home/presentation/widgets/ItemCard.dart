import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/color.dart';
import '../../domain/entities/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      width:  width>1100?243:width>600?243:double.infinity,
      height:  width>1100?322:width>600?322:314,

      decoration: BoxDecoration(
        color: AppColors.secondaryBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: Image.asset(
                  item.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              // Gradient overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 180, // same height as the image
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [

                        Colors.transparent,
                        AppColors.secondaryBgColor
                      //  Colors.black.withOpacity(0.6), // Change this color for different effects
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  // child: Image.asset(
                  //   item.image,
                  //   width: double.infinity,
                  //   height: 180,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              // Overlay elements like status, title, etc.
              Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: AppColors.blackColor.withOpacity(.6),
                    child: Icon(Icons.more_horiz, color: Colors.white)),
              ),
              Positioned(
                bottom: 0,
                left: 12,
                child: Container(
                  width: 156,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color:  AppColors.shadowSelectionColor,
                    border: Border.all(color: AppColors.shadowSelectionColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        item.state,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(width: 6,),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  item.name,
                  style: AppStyle.titleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Date info
                Row(
                  children: [
                    const Icon(Iconsax.calendar_2, color: AppColors.secondaryFontColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      item.dateTime,
                      style: const TextStyle(color: AppColors.secondaryFontColor, fontSize: 12),
                    ),
                  ],
                ),
                // const SizedBox(height: 16),
                Divider(color: AppColors.dividerColor,height: 24,),
                // Bottom row with avatars and task note
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAvatarStack(),

                    Text(
                      item.taskNote,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                 SizedBox(height:  width>1100?24:width>600?24:16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    final int totalAvatars = item.avatarUrls.length;
    final int visibleAvatars = totalAvatars > 3 ? 3 : totalAvatars;

    return SizedBox(

      width: 60,
      height: 24,
      child: Stack(
        children: [
          ...List.generate(visibleAvatars, (index) {
            return Positioned(
              left: index * 13.0,
              child: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(item.avatarUrls[index]),
              ),
            );
          }),
          if (totalAvatars > 3)
            Positioned(
              left: visibleAvatars * 12.0,
              child: Container(
                height: 24,width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondaryBgColor,width: .6),
                  color:  AppColors.dividerColor,
                ),

                child: Center(
                  child: Text(
                    '+${totalAvatars - visibleAvatars}',
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 8.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }}
