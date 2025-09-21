import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';

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
