import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MemberSendOtpEmailApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MemberSendOtpEmailApi() {
    if (Get.isRegistered<MemberSendOtpEmailApi>()) {
      return Get.find<MemberSendOtpEmailApi>();
    } else {
      return Get.put(MemberSendOtpEmailApi._());
    }
  }

  MemberSendOtpEmailApi._();

  @override
  String get route => '/Members';

  AuthRequest sendOtpInEmail({
    int? membersId,
  }) {
    final payload = jsonEncode({
      'MembersId': membersId,
    });

    final request = post(path: '/Otp/SendEmail');

    request.body = payload;

    return request;
  }
}
