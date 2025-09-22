import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/core/service/biometric_secure.dart';
import 'package:loadmore/presentation/pages/home/widget/choose_enjoy_action_widget.dart';
import 'package:local_auth/local_auth.dart';

class BioAccountWidget extends StatefulWidget {
  const BioAccountWidget({super.key});

  @override
  State<BioAccountWidget> createState() => _BioAccountWidgetState();
}

class _BioAccountWidgetState extends State<BioAccountWidget> {
  final LocalAuthentication auth = LocalAuthentication();
  final _bio = BiometricSecure();
  bool _bioAvailable = false;
  final bool _busy = false;

  Future<void> _checkBiometrics() async {
    try {
      final available = await _bio.isBiometricAvailable();
      if (mounted) {
        setState(() {
          _bioAvailable = available;
        });
      }
    } catch (e) {
      debugPrint('Error checking biometrics: $e');
    }
  }

  Future<void> _authenticate() async {
    try {
      if (!_bioAvailable) {
        _showMessage('Thiết bị không hỗ trợ sinh trắc học');
        return;
      }

      final authenticated = await _bio.authenticate();
      if (mounted) {
        if (authenticated) {
          _showMessage('Xác thực thành công!');
        } else {
          _showMessage('Xác thực thất bại!');
        }
      }
    } catch (e) {
      debugPrint('Authentication error: $e');
      if (mounted) {
        _showMessage('Có lỗi xảy ra khi xác thực');
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    super.initState();
    _checkBiometrics(); // Thêm dòng này
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 50,
        ),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(title: 'setYourFingerprint'.tr()),
                const SizedBox(height: 20),
                const Text(
                  'My Account Screen',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            IconButton(
              onPressed: () async {
                await _authenticate();
                await _bio.isBiometricAvailable();
              },

              padding: EdgeInsets.zero,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: Image.asset('assets/images/security.png'),
            ),
            Column(
              children: [
                Text(
                  'Please put your finger on the fingerprint scaner to get started',
                  style: TextStyle(fontSize: 14.sp, color: kGreyColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const TwoButtonWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
