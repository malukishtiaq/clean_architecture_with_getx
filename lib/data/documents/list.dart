import 'dart:convert';
import '../../app/api/api_export.dart';
import 'package:get/get.dart';

class ListApi extends DataInterface with EnvironmentApi, AuthClient {
  factory ListApi() {
    if (Get.isRegistered<ListApi>()) {
      return Get.find<ListApi>();
    } else {
      return Get.put(
        ListApi._(),
      );
    }
  }

  ListApi._();

  @override
  String get route => '/Documents';

  AuthRequest list({
    int? membersId,
  }) {
    final request = post(path: '/List')
      ..body = jsonEncode({
        'MembersId': membersId,
      });

    return request;
  }
}
