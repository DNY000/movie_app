import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/pages/account/widgets/avatar_widget.dart';
import 'package:loadmore/presentation/routes/name_router.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientApp),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 48,
          bottom: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: 'My account'),
              const SizedBox(height: 20),
              AvatarWidget(
                onPress: () {},
                avatarUrl: 'assets/images/Welcome.png',
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  CustomTitleSetting(
                    iconImage: 'assets/icons/profile.svg',
                    name: 'Profile',
                    onTap: () => context.push(NameRouter.editProfile),
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/Key.svg',
                    name: 'Password',
                    onTap: () {},
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/card.svg',
                    name: 'My Card',
                    onTap: () {},
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/language.svg',
                    name: 'Language',
                    onTap: () {},
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/invite.svg',
                    name: 'Invite Friends',
                    onTap: () {},
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/help.svg',
                    name: 'Help',
                    onTap: () {},
                  ),
                  CustomTitleSetting(
                    iconImage: 'assets/icons/setting.svg',
                    name: 'Setting',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  GradientButton(
                    width: double.infinity,
                    onPressed: () {},
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTitleSetting extends StatelessWidget {
  const CustomTitleSetting({
    super.key,
    required this.iconImage,
    required this.name,
    required this.onTap,
  });
  final String iconImage;
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(iconImage),
              const SizedBox(width: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onTap,
            icon: SvgPicture.asset('assets/icons/arrow_right.svg'),
          ),
        ],
      ),
    );
  }
}
