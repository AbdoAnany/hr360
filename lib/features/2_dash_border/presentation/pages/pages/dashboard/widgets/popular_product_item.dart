import 'package:hr360/features/2_dash_border/core_import.dart';

import 'package:flutter/material.dart';

import '../../../shared/widgets/avatar/customer_rounded_avatar.dart';

class PopularProductItem extends StatefulWidget {
  const PopularProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.imageSrc,
    this.isActive = true,
    this.onPressed,
  });

  final String name, price, imageSrc;
  final bool isActive;
  final Function()? onPressed;

  @override
  State<PopularProductItem> createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<PopularProductItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding * 0.5,
        vertical: AppDefaults.padding * 0.75,
      ),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Row(
          children: [
            CustomerRoundedAvatar(imageSrc: widget.imageSrc),
            gapW8,
            Expanded(
              child: Text(
                widget.name,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isHovered ? AppColor.primary : null),
              ),
            ),
            gapW8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.price,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: isHovered ? AppColor.primary : null),
                ),
                gapH4,
                Chip(
                  backgroundColor: widget.isActive
                      ? AppColor.success.withOpacity(0.1)
                      : AppColor.error.withOpacity(0.1),
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding * 0.25,
                      vertical: AppDefaults.padding * 0.25),
                  label: Text(
                    widget.isActive ? "Active" : "Deactive",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: widget.isActive
                            ? AppColor.success
                            : AppColor.error),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
