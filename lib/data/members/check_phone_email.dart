import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MemberscheckPhoneEmailApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MemberscheckPhoneEmailApi() {
    if (Get.isRegistered<MemberscheckPhoneEmailApi>()) {
      return Get.find<MemberscheckPhoneEmailApi>();
    } else {
      return Get.put(
        MemberscheckPhoneEmailApi._(),
      );
    }
  }

  MemberscheckPhoneEmailApi._();

  @override
  String get route => '/Members';

  AuthRequest checkPhoneEmail({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
  }) {
    final request = post(path: '/CheckPhoneEmail')
      ..body = jsonEncode({
        'Email': email,
        'PhoneCountryCode': phoneCountryCode,
        'PhoneNo': phoneNo,
      });

    return request;
  }
}
