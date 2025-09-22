import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/ultis/formatter/formatter.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      "assets/icons/Alarm.svg",
      "assets/icons/Gift.svg",
      "assets/icons/SealCheck.svg",
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 56),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(title: 'Notification'),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder:
                            (context, index) => ContainerNotificationWidget(
                              title: 'Cashback',
                              content:
                                  'You’ve got an cashback for the past ticket booking.',
                              isRead: true,
                              time: TimeFormatter.formatTimeLine(
                                DateTime.now(),
                              ),
                              icon: icons[index],
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerNotificationWidget extends StatelessWidget {
  const ContainerNotificationWidget({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.time,
    required this.isRead,
  });
  final String title;
  final String content;
  final String icon;
  final String time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF62656A).withOpacity(0.2),
      ),
      child: Row(
        children: [
          _iconNotification(icon: icon, isRead: true),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: kGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              time.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconNotification({required bool isRead, required String icon}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF62656A).withOpacity(0.2),
          ),
          child: SvgPicture.asset(icon),
        ),
        Visibility(
          visible: isRead,
          child: Positioned(
            left: -2,
            top: -4,
            child: Container(
              height: 12.h,
              width: 12.w,
              decoration: const BoxDecoration(
                gradient: kGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
