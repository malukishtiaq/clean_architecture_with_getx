import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class SaveSignatureApi extends DataInterface with EnvironmentApi, AuthClient {
  factory SaveSignatureApi() {
    if (Get.isRegistered<SaveSignatureApi>()) {
      return Get.find<SaveSignatureApi>();
    } else {
      return Get.put(
        SaveSignatureApi._(),
      );
    }
  }

  SaveSignatureApi._();

  @override
  String get route => '/Accounts';

  AuthRequest save() {
    final request = patch(path: '/Signature/Save');
    return request;
  }
}
