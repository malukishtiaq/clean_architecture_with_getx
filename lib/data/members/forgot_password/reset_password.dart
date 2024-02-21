import 'dart:convert';
import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class ResetPasswordForgotPasswordApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory ResetPasswordForgotPasswordApi() {
    if (Get.isRegistered<ResetPasswordForgotPasswordApi>()) {
      return Get.find<ResetPasswordForgotPasswordApi>();
    } else {
      return Get.put(ResetPasswordForgotPasswordApi._());
    }
  }

  ResetPasswordForgotPasswordApi._();

  @override
  String get route => '/Members';

  AuthRequest resetPassword({
    int? membersId,
    String? newPassword,
    String? otp,
  }) {
    final payload = jsonEncode({
      'MembersId': membersId,
      'NewPassword': newPassword,
      'Otp': otp,
    });

    final request = post(path: '/ForgotPassword/ResetPassword');

    request.body = payload;

    return request;
  }
}
