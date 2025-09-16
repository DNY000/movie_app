import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final listChoice = [
    'Action',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'Thriller',
    'Western',
    'Sci-Fi',
    'Documentary',
    'Animation',
    'Adventure',
    'Crime',
    'Mystery',
    'Romance',
    'Thriller',
    'Western',
    'Sci-Fi',
    'Documentary',
    'Animation',
    'Adventure',
    'Crime',
  ];
  List<String> listAnswer = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 24,
          top: 56,
          right: 24,
          bottom: 24,
        ),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          children: [
            /// Nội dung có thể cuộn
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(title: 'chooseYourInterest'),
                    const SizedBox(height: 24),
                    const Text(
                      'titleChoseYourInterest',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ).tr(),
                    const SizedBox(height: 40),
                    Image.asset('assets/images/film.png'),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          listChoice
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      listAnswer.contains(e)
                                          ? listAnswer.remove(e)
                                          : listAnswer.add(e);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient:
                                          listAnswer.contains(e)
                                              ? kGradient
                                              : null,
                                      border:
                                          listAnswer.contains(e)
                                              ? null
                                              : Border.all(
                                                color: kGreyLightColor,
                                              ),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color:
                                            listAnswer.contains(e)
                                                ? kDarkTextColor
                                                : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            const TwoButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class TwoButtonWidget extends StatelessWidget {
  const TwoButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GradientButton(
            isEnabled: false,
            onPressed: () {},
            child: Text(
              'skip'.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GradientButton(
            gradient: kGradient,
            onPressed: () {},
            child: Text(
              'continue'.tr(),
              style: const TextStyle(
                color: kDarkTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
