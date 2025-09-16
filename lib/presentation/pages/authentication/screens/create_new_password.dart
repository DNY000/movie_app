import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/common/textField/custom_text_field.dart';
import 'package:loadmore/core/config/colors.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPasword = false;
  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomArrowBack(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        height: 36,
                        width: 36,
                      ),
                      Text(
                        'createNewPassword'.tr(),
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
                  Image.asset(
                    'assets/images/enterPassword.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: _password,
                    hintText: 'enterPassword'.tr(),
                    prefixIcon: Icons.lock,
                    suffixIcon:
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                    obscureText: !_showPassword,
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (value.length < 6) {
                        return 'Mật khẩu phải từ 6 ký tự';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _confirmPassword,
                    hintText: 'enterPassword'.tr(),
                    prefixIcon: Icons.lock,
                    suffixIcon:
                        _showConfirmPasword
                            ? Icons.visibility
                            : Icons.visibility_off,
                    obscureText: !_showConfirmPasword,
                    onPressed: () {
                      setState(() {
                        _showConfirmPasword = !_showConfirmPasword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (value.length < 6) {
                        return 'Mật khẩu phải từ 6 ký tự';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 80),

                  GradientButton(
                    onPressed: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
