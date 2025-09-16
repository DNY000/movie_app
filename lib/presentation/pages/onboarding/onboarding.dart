import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/pages/authentication/screens/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> data = [
    {'title': 'welcomeToMovie', 'subtitle': 'subTitleOnboarding'},
    {'title': 'exploreMovies', 'subtitle': 'findYourFavorites'},
    {'title': 'getStartedNow', 'subtitle': 'enjoyStreaming'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Ảnh nền
          Positioned.fill(
            child: Image.asset('assets/images/Welcome.png', fit: BoxFit.cover),
          ),

          /// Slider nội dung
          Center(
            child: CarouselSlider.builder(
              carouselController: _controller,
              itemCount: data.length,
              itemBuilder: (context, index, realIndex) {
                final item = data[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 300),
                      Text(
                        item['title']!.tr(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        item['subtitle']!.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 500.h,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),

          /// Worm indicator
          Positioned(
            bottom: 100.h,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: data.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 4.h,
                  dotWidth: 8.w, // kích thước mặc định của dot
                  expansionFactor: 2, // dot đang chọn sẽ gấp 3 lần => 36.w
                  spacing: 8.w,
                  activeDotColor: Colors.orangeAccent,
                  dotColor: Colors.white54,
                ),
              ),
            ),
          ),

          /// Nút "Bắt đầu" (ở trang cuối)
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Center(
              child: GradientButton(
                width: 180,
                onPressed: () async {
                  await AppPreferences.instance.save<bool>('isOnboarded', true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                gradient: kGradient,
                child: Text(
                  'getStarted'.tr(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
