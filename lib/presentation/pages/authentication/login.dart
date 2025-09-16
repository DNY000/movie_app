import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loadmore/core/common/button/custom_button_app.dart';
import 'package:loadmore/core/common/login/other_login.dart';
import 'package:loadmore/core/config/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(color: const Color.fromRGBO(0, 0, 0, 0.4)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60,),
              SvgPicture.asset(SvgAssets.logoApp),
              const SizedBox(height: 80,),
              Text('welcomeBack'.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white

              ),),
              const SizedBox(height: 24),
              CustomButtonApp(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                onPress: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.facebook, height: 36,width: 36, colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn), ),
                    const SizedBox(width: 8),
                    Text(
                      'continueWithFacebook'.tr(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomButtonApp(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPress: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.google),
                    const SizedBox(width: 8),
                    Text(
                      'continueWithGoogle'.tr(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomButtonApp(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                onPress: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.apple,),
                    const SizedBox(width: 8),
                    Text(
                      'continueWithApple'.tr(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              const OtherLogin(text: 'or',),
            ],
          ),
        ],
      ),
    );
  }
}
