import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class MembersAvatarGetApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersAvatarGetApi() {
    if (Get.isRegistered<MembersAvatarGetApi>()) {
      return Get.find<MembersAvatarGetApi>();
    } else {
      return Get.put(
        MembersAvatarGetApi._(),
      );
    }
  }

  MembersAvatarGetApi._();

  @override
  String get route => '/Members/Avatar';

  AuthRequest getAvatar({required int membersId}) {
    final request = get(path: '/Get/$membersId');
    return request;
  }
}
