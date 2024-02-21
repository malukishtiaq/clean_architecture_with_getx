import 'dart:convert';

import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class SaveApi extends DataInterface with EnvironmentApi, AuthClient {
  factory SaveApi() {
    if (Get.isRegistered<SaveApi>()) {
      return Get.find<SaveApi>();
    } else {
      return Get.put(SaveApi._());
    }
  }

  SaveApi._();

  @override
  String get route => '/Members';

  AuthRequest save({
    int? membersId,
    String? devicePlatform,
    String? deviceToken,
    String? osVersion,
    String? modelName,
    String? appVersion,
  }) {
    final payload = jsonEncode({
      'MembersId': membersId,
      'DevicePlatform': devicePlatform,
      'DeviceToken': deviceToken,
      'OSVersion': osVersion,
      'ModelName': modelName,
      'AppVersion': appVersion,
    });

    final request = patch(path: '/Devices/Save');

    request.body = payload;

    return request;
  }
}
