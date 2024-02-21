import 'dart:convert';
import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class SendOtpForgotPasswordApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory SendOtpForgotPasswordApi() {
    if (Get.isRegistered<SendOtpForgotPasswordApi>()) {
      return Get.find<SendOtpForgotPasswordApi>();
    } else {
      return Get.put(SendOtpForgotPasswordApi._());
    }
  }

  SendOtpForgotPasswordApi._();

  @override
  String get route => '/Members';

  AuthRequest sendOtp({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
  }) {
    final payload = jsonEncode({
      'Email': email,
      'PhoneCountryCode': phoneCountryCode,
      'PhoneNo': phoneNo,
    });

    final request = post(path: '/ForgotPassword/SendOtp');

    request.body = payload;

    return request;
  }
}
