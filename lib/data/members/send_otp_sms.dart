import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MemberSendOtpSmsApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MemberSendOtpSmsApi() {
    if (Get.isRegistered<MemberSendOtpSmsApi>()) {
      return Get.find<MemberSendOtpSmsApi>();
    } else {
      return Get.put(MemberSendOtpSmsApi._());
    }
  }

  MemberSendOtpSmsApi._();

  @override
  String get route => '/Members';

  AuthRequest sendOtpInSms({
    int? membersId,
  }) {
    final payload = jsonEncode({
      'MembersId': membersId,
    });

    final request = post(path: '/Otp/SendSms');

    request.body = payload;

    return request;
  }
}
