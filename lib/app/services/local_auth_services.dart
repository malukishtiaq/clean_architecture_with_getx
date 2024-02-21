import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthServices extends GetxController {
  factory LocalAuthServices() {
    if (Get.isRegistered<LocalAuthServices>()) {
      return Get.find<LocalAuthServices>();
    } else {
      return Get.put(LocalAuthServices._());
    }
  }

  LocalAuthServices._();

  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
        localizedReason: 'Biometric authentication',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }
}
