import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/common/login/other_login.dart';
import 'package:loadmore/core/common/textField/custom_text_field.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/config/constant.dart';
import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/pages/authentication/screens/forgot_password.dart';
import 'package:loadmore/presentation/pages/navigator_bar.dart';

class LoginWithPassword extends StatefulWidget {
  const LoginWithPassword({super.key});

  @override
  State<LoginWithPassword> createState() => _LoginWithPasswordState();
}

class _LoginWithPasswordState extends State<LoginWithPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _showPassword = true;
  bool _rememberMe = false;
  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  void initData() {
    final remember = AppPreferences.instance.get<bool>('rememberMe') ?? false;
    setState(() {
      _rememberMe = remember;
      if (_rememberMe) {
        _email.text = AppPreferences.instance.get<String>('email') ?? '';
        _password.text = AppPreferences.instance.get<String>('password') ?? '';
      }
    });
  }

  Future<void> _logIn() async {
    if (_formKey.currentState!.validate()) {
      if (_rememberMe) {
        await AppPreferences.instance.save<String>('email', _email.text);
        await AppPreferences.instance.save<String>('password', _password.text);
        await AppPreferences.instance.save<bool>('rememberMe', true);
      }
      await AppPreferences.instance.save<bool>('isLogin', true);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      SvgPicture.asset(SvgAssets.logoApp),
                      const SizedBox(height: 40),
                      Text(
                        'loginToYourAccount'.tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _email,
                              hintText: 'email'.tr(),
                              prefixIcon: Icons.email_outlined,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '  Vui lòng nhập email';
                                }
                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(value)) {
                                  return '  Email không hợp lệ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),
                            CustomTextField(
                              controller: _password,
                              hintText: 'password'.tr(),
                              prefixIcon: Icons.lock,
                              suffixIcon:
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                ),
                                value: _rememberMe,
                                activeColor: kYellowColor,
                                checkColor: Colors.white,

                                onChanged: (value) async {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                  await AppPreferences.instance.save<bool>(
                                    'rememberMe',
                                    value ?? false,
                                  );
                                },
                              ),
                              Text(
                                "rememberMe".tr(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'forgotPassword'.tr(),
                              style: const TextStyle(color: kYellowColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      GradientButton(
                        width: double.infinity,
                        onPressed: _logIn,
                        gradient: kGradient,
                        child: Text(
                          'singIn'.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: kDarkTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const OtherLogin(
                        text: 'orContinueWith',
                        showLoginOther: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
