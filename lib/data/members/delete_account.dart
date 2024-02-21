import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersDeleteAccountApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersDeleteAccountApi() {
    if (Get.isRegistered<MembersDeleteAccountApi>()) {
      return Get.find<MembersDeleteAccountApi>();
    } else {
      return Get.put(
        MembersDeleteAccountApi._(),
      );
    }
  }

  MembersDeleteAccountApi._();

  @override
  String get route => '/Members';

  AuthRequest deleteAccount({
    int? id,
  }) {
    final request = delete(path: '/Delete');

    request.body = jsonEncode({
      'MembersId': id,
    });

    return request;
  }
}
