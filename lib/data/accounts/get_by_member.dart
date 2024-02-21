import 'dart:convert';

import '../../../app/api/api_export.dart';
import 'package:get/get.dart';

class GetByMemberApi extends DataInterface with EnvironmentApi, AuthClient {
  factory GetByMemberApi() {
    if (Get.isRegistered<GetByMemberApi>()) {
      return Get.find<GetByMemberApi>();
    } else {
      return Get.put(
        GetByMemberApi._(),
      );
    }
  }

  GetByMemberApi._();

  @override
  String get route => '/Accounts';

  AuthRequest getByMember({
    int? membersId,
  }) {
    final request = post(path: '/GetByMember')
      ..body = jsonEncode({
        'MembersId': membersId,
      });

    return request;
  }
}
