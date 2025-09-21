import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loadmore/core/config/colors.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    required this.onPress,
  });
  final String avatarUrl;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          right: -4,
          child: Material(
            borderRadius: BorderRadius.circular(32),
            color: Colors.transparent,

            child: IconButton(
              onPressed: onPress,
              icon: Container(
                height: 32.h,
                width: 32.w,

                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: kYellowColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
