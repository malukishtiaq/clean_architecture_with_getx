import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MemberOtpApi extends DataInterface with EnvironmentApi, AuthClient {
  factory MemberOtpApi() {
    if (Get.isRegistered<MemberOtpApi>()) {
      return Get.find<MemberOtpApi>();
    } else {
      return Get.put(MemberOtpApi._());
    }
  }

  MemberOtpApi._();

  @override
  String get route => '/Members';

  AuthRequest getOtpInEmail({
    String? email,
  }) {
    final payload = jsonEncode({
      'Email': email,
    });

    final request = post(path: '/GetOtp');

    request.body = payload;

    return request;
  }
}
