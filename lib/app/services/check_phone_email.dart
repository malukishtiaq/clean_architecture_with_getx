import 'dart:convert';
import 'package:get/get.dart';

import '../../data/members/export.dart';
import '../../domain/use_cases/api_invalid.dart';
import '../tools/functions/api.dart';

class CheckPhoneEmailService extends GetxController {
  factory CheckPhoneEmailService() {
    if (Get.isRegistered<CheckPhoneEmailService>()) {
      return Get.find<CheckPhoneEmailService>();
    } else {
      return Get.put(CheckPhoneEmailService._());
    }
  }

  CheckPhoneEmailService._();

  final _membersCheckPhoneEmailApi = MemberscheckPhoneEmailApi();

  Future<String?> checkPhoneEmail({
    required String? email,
    required String? phoneCountryCode,
    required String? phoneNo,
  }) async {
    return await _membersCheckPhoneEmailApi
        .checkPhoneEmail(
      email: email,
      phoneCountryCode: phoneCountryCode,
      phoneNo: phoneNo,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          return null;
        } else {
          final errorValue = ApiInvalidUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return errorValue.message;
        }
      },
      forceCall: true,
    );
  }
}
