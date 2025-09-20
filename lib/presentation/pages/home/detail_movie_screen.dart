import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:readmore/readmore.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({super.key});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  List<String> action = ['Badge', 'Adventure', 'Fantasy'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 440,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Welcome.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 48,
                    child: CustomArrowBack(
                      onPress: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    right: 24,
                    top: 48,
                    child: CustomArrowBack(
                      onPress: () => Navigator.pop(context),
                      isFavorite: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Back Adam ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '2 hr 30 min',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: kGreyColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                          action.map((e) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: kGreyLightColor,
                                  width: 0.5,
                                ),
                              ),
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: kGreyColor,
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: kYellowColor),
                        const SizedBox(width: 4),
                        Text(
                          '8.7/10',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '193k votes',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: kGreyColor),
                    const SizedBox(height: 24),
                    Text(
                      'About the movie',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    const ReadMoreText(
                      "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods--and imprisoned just as quickly--Black Adam is freed from his earthly tomb, ready to unleash his unique...",
                      trimLines: 3,
                      style: TextStyle(color: kGreyColor),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' View More',
                      trimExpandedText: ' View Less',
                      moreStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      lessStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Cast',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 110, child: CircleAvatarWithName()),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            '173k reviews',
                            style: TextStyle(color: kGreyColor),
                          ),
                        ),
                      ],
                    ),
                    const ReviewWidget(),
                    const SizedBox(height: 16),
                    Text(
                      'Recommended Movies',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kGreyColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 12),
                        itemBuilder:
                            (context, index) => const VerticalMovieCard(),
                      ),
                    ),
                    GradientButton(
                      width: double.infinity,
                      onPressed: () => context.push('/seats'),
                      child: const Text('Select Seats'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarWithName extends StatelessWidget {
  const CircleAvatarWithName({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Welcome.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Dwayne Johnson',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
            Text(
              'Black Adam',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: kGreyColor,
                fontSize: 13.sp,
              ),
            ),
          ],
        );
      },
      separatorBuilder:
          (BuildContext context, int index) => const SizedBox(width: 12),
      itemCount: 10,
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kGreyColor.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Welcome.png'),
                    radius: 20,
                  ),
                  Text(
                    'Black Adam',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kGreyColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '08/04/2025',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: kGreyColor,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const ReadMoreText(
            "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods--and imprisoned just as quickly--Black Adam is freed from his earthly tomb, ready to unleash his unique...",
            trimLines: 6,
            style: TextStyle(color: kGreyColor),
            trimMode: TrimMode.Line,
            trimCollapsedText: ' View More',
            trimExpandedText: ' View Less',
            moreStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            lessStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalMovieCard extends StatelessWidget {
  const VerticalMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 190,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/Welcome.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.star, color: kYellowColor),
            Text(
              '8.3/10',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: kGreyColor,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        Text(
          'Black Panther',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: kGreyColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
