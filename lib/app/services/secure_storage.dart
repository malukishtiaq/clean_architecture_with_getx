import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../constants/secure_storage.dart';

class SecureStorageService extends GetxController {
  factory SecureStorageService() {
    if (Get.isRegistered<SecureStorageService>()) {
      return Get.find<SecureStorageService>();
    } else {
      return Get.put(SecureStorageService._());
    }
  }

  SecureStorageService._();

  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  Future<void> setFaceId({required bool enabled}) async {
    await _secureStorage.write(key: faceId, value: enabled.toString());
  }

  Future<void> setEmail(String? value) async {
    await _secureStorage.write(key: email, value: value);
  }

  Future<void> setPass(String? value) async {
    await _secureStorage.write(key: password, value: value);
  }

  Future<void> setIsRememberMeCredentials(bool? value) async {
    await _secureStorage.write(
      key: isRememberMeCredentials,
      value: value.toString(),
    );
  }

  Future<bool> get faceIdEnabled async {
    final enabled = await _secureStorage.read(key: faceId) == 'true';
    return enabled;
  }

  Future<String?> get storedEmail async {
    return _secureStorage.read(key: email);
  }

  Future<String?> get storedPass async {
    return _secureStorage.read(key: password);
  }

  Future<bool> get storedIsRememberMeCredentials async {
    return await _secureStorage.read(key: isRememberMeCredentials) == 'true';
  }
}
