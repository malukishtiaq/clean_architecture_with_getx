import 'dart:convert';
import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class ValidateOtpForgotPasswordApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory ValidateOtpForgotPasswordApi() {
    if (Get.isRegistered<ValidateOtpForgotPasswordApi>()) {
      return Get.find<ValidateOtpForgotPasswordApi>();
    } else {
      return Get.put(ValidateOtpForgotPasswordApi._());
    }
  }

  ValidateOtpForgotPasswordApi._();

  @override
  String get route => '/Members';

  AuthRequest validateOtp({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
    String? otp,
  }) {
    final payload = jsonEncode({
      'Email': email,
      'PhoneCountryCode': phoneCountryCode,
      'PhoneNo': phoneNo,
      'Otp': otp,
    });

    final request = post(path: '/ForgotPassword/Validate');

    request.body = payload;

    return request;
  }
}
