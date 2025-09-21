import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loadmore/core/config/colors.dart';

class MovieCardHorizontal extends StatelessWidget {
  const MovieCardHorizontal({
    super.key,
    required this.name,
    required this.time,
    required this.image,
    required this.actions,
    required this.rating,
    required this.isFavorite,
    required this.boderRadius,
    required this.icon,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
    required this.onPress,
    required this.onTap,
  });
  final String name;
  final String time;
  final String image;
  final List<String> actions;
  final double rating;
  final bool isFavorite;
  final Color? backgroundColor;
  final double boderRadius;
  final String icon;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPress;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: 136.h,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boderRadius),
          color: kGreyColor.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(boderRadius),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                        onPressed: onPress,
                        icon: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kGreyColor.withOpacity(0.2),
                          ),
                          child: SvgPicture.asset(icon, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      actions.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          actions[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kGreyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.sp, color: kYellowColor),
                      const SizedBox(width: 4),
                      Text(
                        '$rating /10',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
