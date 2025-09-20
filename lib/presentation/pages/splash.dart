import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/pages/authentication/screens/login.dart';
import 'package:loadmore/presentation/pages/navigator_bar.dart';
import 'package:loadmore/presentation/pages/onboarding/onboarding.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/config/constant.dart';
import 'package:loadmore/presentation/routes/name_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final bool isOnboarded =
        AppPreferences.instance.get<bool>('isOnboarded') ?? false;
    final bool isLoggedIn =
        AppPreferences.instance.get<bool>('isLogin') ?? false;

    if (!isOnboarded) {
      if (mounted) {
        context.go(NameRouter.onboarding);
      }
      return;
    }

    if (!isLoggedIn) {
      if (mounted) {
        context.go(NameRouter.login);
      }
      return;
    }

    if (mounted) {
      context.go(NameRouter.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgAssets.logoApp, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
