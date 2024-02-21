import 'dart:convert';

import 'package:get/get.dart';

import '../../app/api/api_export.dart';

class MemberscheckByPhoneApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MemberscheckByPhoneApi() {
    if (Get.isRegistered<MemberscheckByPhoneApi>()) {
      return Get.find<MemberscheckByPhoneApi>();
    } else {
      return Get.put(
        MemberscheckByPhoneApi._(),
      );
    }
  }

  MemberscheckByPhoneApi._();

  @override
  String get route => '/Documents';

  AuthRequest checkMemberByPhone({
    String? fullPhoneNumber,
  }) {
    final request = post(path: '/CheckPhone')
      ..body = jsonEncode({
        'FullPhoneNumber': fullPhoneNumber,
      });

    return request;
  }
}
