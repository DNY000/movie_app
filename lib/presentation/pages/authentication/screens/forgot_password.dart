import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/common/textField/custom_text_field.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/pages/authentication/screens/create_new_password.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  void _goToOtpScreen() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goBack() {
    if (_pageController.page == 1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), 
            children: [
              _buildForgotPasswordScreen(),
              _buildOtpScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomArrowBack(
                onPress: _goBack,
                height: 36,
                width: 36,
              ),
              Text(
                'forgotPassword'.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 40.w),
            ],
          ),
          const SizedBox(height: 45),
          Text(
            'titleForgotPassword'.tr(),
            style: TextStyle(color: kGreyLightColor, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Image.asset('assets/images/enterPassword.png', fit: BoxFit.cover),
          const SizedBox(height: 40),
          CustomTextField(
            controller: _emailController,
            hintText: 'enterEmailOrPassword'.tr(),
            prefixIcon: Icons.email,
          ),
                    const SizedBox(height: 80),

          GradientButton(
            onPressed: _goToOtpScreen,
            gradient: kGradient,
            width: double.infinity,
            child: Text(
              'continue'.tr(),
              style: TextStyle(
                color: kDarkTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              CustomArrowBack(
                onPress: _goBack,
                height: 36,
                width: 36,
              ),
              const Spacer(),
              Text(
                'otpVerify'.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              SizedBox(width: 40.w),
            ],
          ),
          const SizedBox(height: 45),
          Text(
            'pleaseEnterOtp'.tr(),
            style: TextStyle(color: kGreyLightColor, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Image.asset('assets/images/enterPassword.png', fit: BoxFit.cover),
          const SizedBox(height: 40),
            const OtpInputRow(),
                      const SizedBox(height: 20),

            Text('resendCode'.tr()),
         const SizedBox(height: 80),

          GradientButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen(),));
            },
            gradient: kGradient,
            width: double.infinity,
            child: Text(
              'verify'.tr(),
              style: TextStyle(
                color: kDarkTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OtpInputBox extends StatelessWidget {
  final TextEditingController controller;
  final bool isFocused;

  const OtpInputBox({
    super.key,
    required this.controller,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFocused ? Colors.orange : Colors.white54,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, color: Colors.orange),
        keyboardType: TextInputType.number,
        cursorColor: Colors.orange,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class OtpInputRow extends StatefulWidget {
  const OtpInputRow({super.key});

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();

    // Focus vào ô đầu tiên khi mở màn hình
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });

    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        final text = _controllers[i].text;
        if (text.length == 1 && i < _controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        } else if (text.isEmpty && i > 0) {
          _focusNodes[i - 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return _buildOtpInput(index);
      }),
    );
  }

  Widget _buildOtpInput(int index) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _focusNodes[index].hasFocus ? Colors.orange : Colors.white54,
          width: 1.5,
        ),
      ),
      child: TextField(
        focusNode: _focusNodes[index],
        controller: _controllers[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, color: Colors.orange),
        keyboardType: TextInputType.number,
        cursorColor: Colors.orange,
        onChanged: (value) {
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          } else if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
        },
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
