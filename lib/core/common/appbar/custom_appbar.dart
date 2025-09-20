import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loadmore/core/config/colors.dart';

//
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomArrowBack(onPress: () => Navigator.pop(context)),
        const Spacer(),
        Text(
          title.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }
}

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
    required this.onPress,
    this.height = 40,
    this.width = 40,
    this.isFavorite = false,
    this.color = const Color(0xFF333333),
  });
  final VoidCallback onPress;
  final double height;
  final double width;
  final Color color;
  final double padding = 8;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(padding),
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child:
            isFavorite
                ? Icon(Icons.favorite, color: kGreyColor, size: 20.sp)
                : SvgPicture.asset(
                  'assets/icons/arrow_left.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
      ),
    );
  }
}
