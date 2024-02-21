import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class MembersAvatarSaveApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersAvatarSaveApi() {
    if (Get.isRegistered<MembersAvatarSaveApi>()) {
      return Get.find<MembersAvatarSaveApi>();
    } else {
      return Get.put(
        MembersAvatarSaveApi._(),
      );
    }
  }

  MembersAvatarSaveApi._();

  @override
  String get route => '/Members/Avatar';

  AuthRequest uploadAvatar() {
    final request = post(path: '/Save');
    return request;
  }
}
