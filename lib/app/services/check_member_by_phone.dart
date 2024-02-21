import 'dart:convert';

import 'package:get/get.dart';

import '../../data/documents/check_member_by_phone.dart';
import '../../domain/use_cases/check_member_by_phone.dart';
import '../tools/functions/api.dart';

class CheckMemberByPhoneService extends GetxController {
  factory CheckMemberByPhoneService() {
    if (Get.isRegistered<CheckMemberByPhoneService>()) {
      return Get.find<CheckMemberByPhoneService>();
    } else {
      return Get.put(CheckMemberByPhoneService._());
    }
  }

  CheckMemberByPhoneService._();

  final _membersCheckByPhoneApi = MemberscheckByPhoneApi();

  Future<CheckMemberByPhoneUseCase?> checkMemberByPhone({
    required String? fullPhoneNumber,
  }) async {
    return await _membersCheckByPhoneApi
        .checkMemberByPhone(
      fullPhoneNumber: fullPhoneNumber,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          return CheckMemberByPhoneUseCase.fromJson(
            jsonDecode(response.body),
          );
        } else {
          return null;
        }
      },
      forceCall: true,
    );
  }
}
