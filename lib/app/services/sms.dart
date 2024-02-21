import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/functions/permissions.dart';

class SmsService extends GetxController {
  factory SmsService() {
    if (Get.isRegistered<SmsService>()) {
      return Get.find<SmsService>();
    } else {
      return Get.put(SmsService._());
    }
  }

  SmsService._();

  Future<bool?> sendSms(String message, String recipient) async {
    try {
      if (Platform.isIOS) {
        final _launchSms = Uri.parse('sms:$recipient&body=$message');
        return launchUrl(_launchSms);
      }

      if (Platform.isAndroid) {
        final hasPermission = await requestPermissionSendSms();

        if (!hasPermission) return null;

        const _platform = MethodChannel('confidential.bee/functions');

        return await _platform.invokeMethod(
              'sendSms',
              {
                'phoneNumber': recipient,
                'message': message,
              },
            ) ==
            true;
      }

      return kIsWeb;
    } catch (e) {
      return null;
    }
  }
}
