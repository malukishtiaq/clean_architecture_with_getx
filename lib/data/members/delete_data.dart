import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersDeleteDataApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersDeleteDataApi() {
    if (Get.isRegistered<MembersDeleteDataApi>()) {
      return Get.find<MembersDeleteDataApi>();
    } else {
      return Get.put(
        MembersDeleteDataApi._(),
      );
    }
  }

  MembersDeleteDataApi._();

  @override
  String get route => '/Members';

  AuthRequest deleteData({
    int? id,
  }) {
    final request = delete(path: '/DeleteData');

    request.body = jsonEncode({
      'MembersId': id,
    });

    return request;
  }
}
