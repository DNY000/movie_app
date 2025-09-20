import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricSecure {
  final _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      final supported = await _auth.isDeviceSupported();
      debugPrint('Device supported: $supported');

      if (!supported) return false;

      final canCheck = await _auth.canCheckBiometrics;
      debugPrint('Can check biometrics: $canCheck');

      if (!canCheck) return false;

      final biometrics = await _auth.getAvailableBiometrics();
      debugPrint('Available biometrics: $biometrics');

      return biometrics.isNotEmpty;
    } catch (e) {
      debugPrint('Error checking biometrics: $e');
      return false;
    }
  }

  Future<bool> authenticate({String reason = 'Xác thực sinh trắc học'}) async {
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final isSupported = await _auth.isDeviceSupported();

      debugPrint('Can check: $canCheck, Is supported: $isSupported');

      if (!canCheck || !isSupported) return false;

      final didAuthenticate = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      debugPrint('Authentication result: $didAuthenticate');
      return didAuthenticate;
    } on PlatformException catch (e) {
      debugPrint('Platform Exception during authentication: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('Error during authentication: $e');
      return false;
    }
  }
}
