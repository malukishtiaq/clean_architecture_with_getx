import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MemberValidateOtpApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MemberValidateOtpApi() {
    if (Get.isRegistered<MemberValidateOtpApi>()) {
      return Get.find<MemberValidateOtpApi>();
    } else {
      return Get.put(MemberValidateOtpApi._());
    }
  }

  MemberValidateOtpApi._();

  @override
  String get route => '/Members';

  AuthRequest validateOtp({
    int? membersId,
    String? otp,
    bool? isEmail,
  }) {
    final payload = jsonEncode({
      'MembersId': membersId,
      'Otp': otp,
      'IsEmail': isEmail,
    });

    final request = post(path: '/Otp/Validate');

    request.body = payload;

    return request;
  }
}
