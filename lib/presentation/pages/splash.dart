import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/pages/authentication/screens/login.dart';
import 'package:loadmore/presentation/pages/navigator_bar.dart';
import 'package:loadmore/presentation/pages/onboarding/onboarding.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/config/constant.dart';

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

     
    final isOnboarded =  AppPreferences.instance.get<bool>('isOnboarded') ?? false;
    final token = AppPreferences.instance.get<bool>('isLogin'); 

    if (!isOnboarded ) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else if (token==null ||token==false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
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
