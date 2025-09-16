import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loadmore/core/common/button/custom_button_app.dart';
import 'package:loadmore/core/common/custom_line.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/pages/authentication/screens/login_with_password.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({
    super.key,
    required this.text,
    this.showLoginOther = false,
  });
  final String text;
  final bool showLoginOther;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: DashedLine()),
              const SizedBox(width: 8),
              Text(
                text.tr(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),

              const Expanded(child: DashedLine()),
            ],
          ),
          const SizedBox(height: 24),
          if (!showLoginOther)
            GradientButton(
              width: double.infinity,
              gradient: kGradient,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginWithPassword(),
                  ),
                );
              },
              child: Text(
                'loginWithPassword'.tr(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kDarkTextColor,
                ),
              ),
            ),
          if (showLoginOther)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButtonApp(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  onPress: () {},
                  child: const FaIcon(FontAwesomeIcons.facebook, size: 24),
                ),
                const SizedBox(width: 12),
                CustomButtonApp(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),

                  onPress: () {},
                  child: const FaIcon(FontAwesomeIcons.google, size: 24),
                ),
                const SizedBox(width: 12),
                CustomButtonApp(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),

                  onPress: () {},
                  child: const FaIcon(FontAwesomeIcons.apple, size: 24),
                ),
              ],
            ),
          TextButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'don’tHaveAnAccount'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'register'.tr(),
                    style: TextStyle(
                      color: kYellowColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
