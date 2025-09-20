import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/pages/search/search.dart';
import 'package:pinput/pinput.dart';

class CreateNewPinWidget extends StatefulWidget {
  const CreateNewPinWidget({super.key});

  @override
  State<CreateNewPinWidget> createState() => _CreateNewPinWidgetState();
}

class _CreateNewPinWidgetState extends State<CreateNewPinWidget> {
  final TextEditingController _pinPutController = TextEditingController();
  @override
  void dispose() {
    _pinPutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultStylePinPut = PinTheme(
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.white54),
      ),
    );
    final submittedPinTheme = defaultStylePinPut.copyWith(
      decoration: defaultStylePinPut.decoration!.copyWith(
        border: Border.all(color: kYellowColor),
      ),
      textStyle: defaultStylePinPut.textStyle?.copyWith(color: kYellowColor),
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomAppBar(title: 'creNewPw'.tr()),
                const SizedBox(height: 24),
                const Text(
                  'titleChoseYourInterest',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ).tr(),
                const SizedBox(height: 40),
                Center(
                  child: Pinput(
                    length: 4,
                    defaultPinTheme: defaultStylePinPut,
                    submittedPinTheme: submittedPinTheme,
                    controller: _pinPutController,
                    focusedPinTheme: submittedPinTheme.copyWith(
                      decoration: submittedPinTheme.decoration!.copyWith(
                        border: Border.all(color: Colors.blueAccent, width: 2),
                      ),
                    ),
                    obscureText: false,
                    // obscuringWidget: Container(
                    //   width: 14,
                    //   height: 14,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     shape: BoxShape.circle,
                    //   ),
                    // ),
                    preFilledWidget: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),

                    showCursor: true,
                    onCompleted: (pin) => debugPrint('Completed: $pin'),
                  ),
                ),
              ],
            ),
            const TwoButtonWidget(),
          ],
        ),
      ),
    );
  }
}
