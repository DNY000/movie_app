import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loadmore/core/common/button/custom_button_app.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> action = [
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
  ];
  String selectedAction = 'Action';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 56,
          bottom: 24,
        ),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NameAndAvatar(),
              const Text(
                'Take a break and watch a movie. You deserve it!',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 32,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            selectedAction = action[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                selectedAction == action[index]
                                    ? Colors.white24
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            gradient:
                                selectedAction == action[index]
                                    ? kGradient
                                    : null,
                          ),
                          child: Text(
                            action[index],
                            style: TextStyle(
                              color:
                                  selectedAction == action[index]
                                      ? Colors.white
                                      : Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemCount: action.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              const SizedBox(height: 16),
              const PageViewCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class NameAndAvatar extends StatelessWidget {
  const NameAndAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome Duy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 28.sp),
          ),
        ],
      ),
    );
  }
}

class CartMovieWidget extends StatelessWidget {
  const CartMovieWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.rating,
    required this.action,
    required this.description,
    required this.year,
    this.onTap,
    this.watchNow,
    this.isFavorite,
    this.color,
    this.border = 24,
    this.padding = 12,
    this.heightCard = 540,
    this.heigthSubCard = 175,
  });
  final String image;
  final String title;
  final String time;
  final String rating;
  final List<String> action;
  final String description;
  final String year;
  final Function()? onTap;
  final Function()? watchNow;
  final Function()? isFavorite;
  final Color? color;
  final double border;
  final double padding;
  final double heightCard;
  final double heigthSubCard;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightCard,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: heightCard - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(border),
                color: color ?? Colors.white,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 32,
            child: CustomButtonApp(
              onPress: () {},
              child: const Icon(Icons.favorite),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: CustomButtonApp(
              gradient: kGradientLinearApp,
              height: heigthSubCard,
              radius: border,
              onPress: () {},
              child: Padding(
                padding: EdgeInsets.all(padding.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children:
                          action
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: kYellowColor,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                rating,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 16.w),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: watchNow,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kYellowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              label: Text(
                                'Watch Now',
                                style: TextStyle(
                                  color: kDarkTextColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              icon: const Icon(Icons.play_arrow),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewCardWidget extends StatefulWidget {
  const PageViewCardWidget({super.key});

  @override
  State<PageViewCardWidget> createState() => _PageViewCardWidgetState();
}

class _PageViewCardWidgetState extends State<PageViewCardWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 540,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true,

            children: [
              CartMovieWidget(
                image: 'assets/images/Welcome.png',
                title: 'The Great Adventure',
                time: '2h 30m',
                rating: '8.5',
                year: '2023',
                description:
                    'An epic journey of a group of friends who set out to explore the unknown.',
                action: const ['Action', 'Adventure', 'Drama'],
                watchNow: () {},
                isFavorite: () {},
                onTap: () {
                  print('Tapped on The Great Adventure');
                  context.push('/detailMovie');
                },
              ),
              CartMovieWidget(
                image: 'assets/images/Welcome.png',
                title: 'The Great Adventure',
                time: '2h 30m',
                rating: '8.5',
                year: '2023',
                description:
                    'An epic journey of a group of friends who set out to explore the unknown.',
                action: const ['Action', 'Adventure', 'Drama'],
                watchNow: () {},
                isFavorite: () {},
              ),
              CartMovieWidget(
                image: 'assets/images/Welcome.png',
                title: 'The Great Adventure',
                time: '2h 30m',
                rating: '8.5',
                year: '2023',
                description:
                    'An epic journey of a group of friends who set out to explore the unknown.',
                action: const ['Action', 'Adventure', 'Drama'],
                watchNow: () {},
                isFavorite: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: kYellowColor,
            dotColor: Colors.white54,
          ),
        ),
      ],
    );
  }
}
