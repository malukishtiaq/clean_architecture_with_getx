import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersSavePasswordApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersSavePasswordApi() {
    if (Get.isRegistered<MembersSavePasswordApi>()) {
      return Get.find<MembersSavePasswordApi>();
    } else {
      return Get.put(
        MembersSavePasswordApi._(),
      );
    }
  }

  MembersSavePasswordApi._();

  @override
  String get route => '/Members';

  AuthRequest savePassword({
    required int membersId,
    required String currentPassword,
    required String newPassword,
  }) {
    final request = patch(path: '/SavePassword')
      ..body = jsonEncode({
        'MembersId': membersId,
        'CurrentPassword': currentPassword,
        'NewPassword': newPassword,
      });

    return request;
  }
}
