import 'package:get/get.dart';

import '../../../../data/members/export.dart';
import '../../../tools/functions/api.dart';

class SaveService extends GetxController {
  factory SaveService() {
    if (Get.isRegistered<SaveService>()) {
      return Get.find<SaveService>();
    } else {
      return Get.put(SaveService._(), permanent: true);
    }
  }

  SaveService._();

  final _saveApi = SaveApi();

  Future<bool?> save({
    int? membersId,
    String? devicePlatform,
    String? deviceToken,
    String? osVersion,
    String? modelName,
    String? appVersion,
  }) async {
    try {
      await _saveApi
          .save(
        membersId: membersId,
        devicePlatform: devicePlatform,
        deviceToken: deviceToken,
        osVersion: osVersion,
        modelName: modelName,
        appVersion: appVersion,
      )
          .call(
        (response) {
          final isSuccess = isSuccessResponse(response);
          if (isSuccess) {
            return true;
          }
          return false;
        },
        forceCall: true,
      );
      return false;
    } catch (e) {
      return false;
    }
  }
}
