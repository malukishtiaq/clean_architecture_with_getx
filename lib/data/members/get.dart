import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersGetApi extends DataInterface with EnvironmentApi, AuthClient {
  factory MembersGetApi() {
    if (Get.isRegistered<MembersGetApi>()) {
      return Get.find<MembersGetApi>();
    } else {
      return Get.put(
        MembersGetApi._(),
      );
    }
  }

  MembersGetApi._();

  @override
  String get route => '/Members';

  AuthRequest getMemberInfo({
    int? id,
  }) {
    final request = post(path: '/Get');

    request.body = jsonEncode({
      'MembersId': id,
    });

    return request;
  }
}
