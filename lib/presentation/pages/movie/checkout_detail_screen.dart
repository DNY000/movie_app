import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/ultis/formatter/formatter.dart';

class CheckoutDetailScreen extends StatelessWidget {
  const CheckoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          children: [
            const CustomAppBar(title: 'Sumary'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kGreyColor.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InformationCardMovieWidget(
                    action: [' Adventure  ', 'Fantasy'],
                    language: ['ENG', 'VIETSUB'],
                    tagOld: '16+',
                    title: 'Black Adam',
                    time: 3828,
                    image: 'assets/images/Welcome.png',
                  ),

                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                        SizedBox(height: 12),

                        CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                        SizedBox(height: 12),

                        CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                        SizedBox(height: 12),

                        CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                        SizedBox(height: 12),

                        Divider(color: kGreyColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'Sumary',
                    style: TextStyle(fontSize: 20.sp, color: kGreyColor),
                  ),
                  const SizedBox(height: 20),

                  const CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                  const SizedBox(height: 12),

                  const CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                  const SizedBox(height: 12),

                  const CustomRowApp(name: "CINEMA", value: 'CGV Pearl Plaza'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GradientButton(
              width: double.infinity,
              onPressed: () {},
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: kDarkTextColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationCardMovieWidget extends StatelessWidget {
  const InformationCardMovieWidget({
    super.key,
    required this.title,
    required this.image,
    required this.tagOld,
    required this.language,
    required this.action,
    required this.time,
  });
  final String title;
  final String image;
  final String tagOld;
  final List<String> language;
  final List<String> action;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 119.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Text(
                      tagOld,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: kDarkTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ...List.generate(language.length, (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(
                        language[index],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                children: List.generate(action.length, (index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(
                      action[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 8),
              Text(
                TimeFormatter.formatSecondsToReadable(time),
                style: TextStyle(fontSize: 14.sp, color: kGreyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomRowApp extends StatelessWidget {
  const CustomRowApp({super.key, required this.value, required this.name});
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 16.sp,
            color: kGreyColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
